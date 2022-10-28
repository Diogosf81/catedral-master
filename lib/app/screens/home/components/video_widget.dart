import 'package:catedral/api/api.dart';
import 'package:catedral/app/models/video.dart';
import 'package:catedral/app/screens/videos/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key}) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {

  _listarVideos() {
    Api api = Api();
    return api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text(
              'none',
              style: TextStyle(color: Colors.black),
            );
          case ConnectionState.waiting:
            return Container(
              height: 150,
              child: Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(
                      color: Color.fromARGB(255, 22, 125, 127),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Carregando...',
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            );
            break;
          case ConnectionState.active:
            return Center(
              child: Text('active'),
              //CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasData) {
              return SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    List<Video>? videos = snapshot.data;
                    Video video = videos![index];

                    return SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () {
                            print(video.id);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) {
                                  return VideoPlayerScreen(
                                    videoId: video.id,
                                    videoTitle: video.titulo,
                                    videoCanal: video.canal,
                                    videoDescricao: video.descricao,
                                  );
                                },
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 180,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(video.imagem))),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Color.fromARGB(122, 22, 125, 127),
                                      size: 100,
                                    ),
                                  ),
                                  Positioned(
                                    top: 95,
                                    child: Container(
                                      width: 180,
                                      height: 5,
                                      color: Color.fromARGB(255, 22, 125, 127),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                video.titulo,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 22, 125, 127),
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  //separatorBuilder: (BuildContext context, int index) => Divider(height: 2, color: Colors.grey,),
                  itemCount: snapshot.data!.length,
                ),
              );
            } else {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 90,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_off, color: Colors.grey),
                      Text(
                          "Ocorreu um erro no carregamento.\nVerifique sua internet!",
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              );
            }
            break;
        }
      },
    );
  }
}
