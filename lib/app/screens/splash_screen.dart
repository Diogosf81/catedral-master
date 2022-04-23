import 'dart:async';
import 'package:catedral/app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    Timer(const Duration(seconds: 5), onCloseDialog);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onCloseDialog() {
    if (mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      //alignment: Alignment(-1, 1),
                      image: AssetImage('assets/banner.png'))),
            ),
            Positioned(
                bottom: 50,
                child: Image(
                  image: AssetImage('assets/logo_br.png'),
                  width: 100,
                ))
          ],
        ));
  }
}
