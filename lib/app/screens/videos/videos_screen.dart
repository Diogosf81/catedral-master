import 'package:catedral/api/api.dart';
import 'package:catedral/app/models/video.dart';
import 'package:catedral/app/screens/videos/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideosScreen extends StatefulWidget {
  @override
  VideosScreenState createState() => VideosScreenState();
}

class VideosScreenState extends State<VideosScreen> {
  //late WebViewController controller;

  _listarVideos() {
    Api api = Api();
    return api.pesquisarVideos("");
  }

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    //if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black54,
          //leading: Icon(Icons.arrow_back, color: Colors.black54,),
          title: Text(
            'Videos/Podcasts',
            style: GoogleFonts.roboto(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.search),
          //   )
          // ],
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FutureBuilder<List<Video>>(
              future: _listarVideos(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('none');
                  case ConnectionState.waiting:
                    return Center(
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Color.fromARGB(255, 22, 125, 127),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Carregando...',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold),
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
                      return ListView.separated(
                        itemCount: snapshot.data!.length,
                        separatorBuilder: (context, index) => Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          List<Video>? videos = snapshot.data;
                          Video video = videos![index];

                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (ctx) {
                                    return VideoPlayerScreen(
                                      videoId: video.id,
                                      videoTitle: video.titulo,
                                      videoCanal: video.canal,
                                      videoDescricao: video.descricao,
                                    );
                                  }));
                                },
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(video.imagem),
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(video.titulo),
                                subtitle: Text(video.descricao),
                              )
                            ],
                          );
                        },
                        //separatorBuilder: (BuildContext context, int index) => Divider(height: 2, color: Colors.grey,),
                      );
                    } else {
                      return Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
            ),
          ),
        ) // WebView(
        //   initialUrl: 'http://catedraldafamilia.com.br/videos/',
        //   javascriptMode: JavascriptMode.unrestricted,
        //   onWebViewCreated: (controller) {
        //     this.controller = controller;
        //   },
        //
        //   onPageFinished: (String url) async {
        //     print('Page finished loading: $url');
        //
        //     controller.runJavascriptReturningResult(
        //         "document.getElementsByTagName('header')[0].style.display='none'"
        //     );
        //
        //     controller.runJavascriptReturningResult(
        //         "document.getElementsByTagName('footer')[0].style.display='none'"
        //     );
        //   },
        // ),
        );
  }
}
