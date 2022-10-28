import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerScreen extends StatefulWidget {
  String videoId;
  String videoTitle;
  String videoCanal;
  String videoDescricao;

  VideoPlayerScreen({
    Key? key,
    required this.videoId,
    required this.videoTitle,
    required this.videoCanal,
    required this.videoDescricao,
  }) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      params: YoutubePlayerParams(
        autoPlay: false,
        mute: false,
        showFullscreenButton: true,
        showControls: true,
        desktopMode: true,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    };
    _controller.onExitFullscreen = () {};
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          //AppBar
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color.fromARGB(255, 22, 125, 127)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Vídeo",
              style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 22, 125, 127),
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: false,
          ),

          //Body
          body: Column(
            children: [
              YoutubePlayerControllerProvider(
                controller: _controller,
                child: YoutubePlayerIFrame(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 5,
                color: Color.fromARGB(255, 22, 125, 127),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.videoTitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
