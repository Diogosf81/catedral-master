import 'package:catedral/app/screens/calendario/calendario_screen.dart';
import 'package:catedral/app/screens/home/home_screen.dart';
import 'package:catedral/app/screens/loading.dart';
import 'package:catedral/app/screens/menu/menu_screen.dart';
import 'package:catedral/app/screens/videos/videos_screen.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        allowImplicitScrolling: true,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [

          //Início
          HomeScreen(),

          //Vídeos
          VideosScreen(),

          //Eventos
          CalendarioScreen(),

          //Mais
          MenuScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 22, 125, 127),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Início',),
          BottomNavigationBarItem(icon: Icon(Icons.mic),label: 'Podcast',),
          BottomNavigationBarItem(icon: Icon(Icons.event_outlined),label: 'Eventos',),
          BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'Mais',),
        ],

      ),
    );
  }
}
