import 'package:catedral/app/models/video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_CATEDRAL_API = "AIzaSyD9cu7l1TPpjC2L9cjMsr6HgAYIpRypwD8";
const ID_CANAL = "UClaiGy5RB6l1j7TSNQrCNvg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=5"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_CATEDRAL_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"
    ));

    //print("resultado: " + response.body);

     if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      //print("resultado: " + response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
       return List.empty();
       // print(response.statusCode);
     }
  }

  Future<List<Video>> pesquisarVideos(String live) async {
    http.Response response = await http.get(Uri.parse(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_CATEDRAL_API"
            "&channelId=$ID_CANAL"
            "&q=$live"
    ));

    //print("resultado: " + response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      //print("resultado: " + response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      return List.empty();
      // print(response.statusCode);
    }
  }

}
