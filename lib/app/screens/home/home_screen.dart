import 'dart:async';
import 'package:catedral/app/screens/home/components/carousel_widget.dart';
import 'package:catedral/app/screens/home/components/texto_widget.dart';
import 'package:catedral/app/screens/search_grupo/search_grupo_screen.dart';
import 'package:catedral/app/screens/videos/videos_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextWidget texto = TextWidget();

  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() => subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          //showDialogBox();
          setState(() => isAlertSet = true);
        }
      });

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        //AppBar
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Image.asset(
            'assets/logo_catedral.png',
            fit: BoxFit.contain,
            height: 80,
            width: 80,
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.account_circle,
          //       color: Color.fromARGB(255, 22, 125, 127),
          //       size: 30,
          //     ),
          //   )
          // ],
        ),


        //Body
      //   body: LayoutBuilder(
      //     builder: (context , BoxConstraints ) {
      //       switch (!isDeviceConnected && isAlertSet == false){
      //         case
      //           return
      //       }
      //     },
      //
      //   )
      // );


        body:
        // !isDeviceConnected || isAlertSet == false
        //     ? Center(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           CircularProgressIndicator(
        //             color: Color.fromARGB(255, 22, 125, 127),
        //           ),
        //           SizedBox(height: 10,),
        //           Text('Carregando...', style: TextStyle(
        //             fontSize: 18
        //           ),)
        //         ],
        //       ),
        //     )
        //     :
        SingleChildScrollView(
                child: Column(
                  children: [
                    // Stack(
                    //   children: [
                    //     Container(
                    //       width: MediaQuery.of(context).size.width,
                    //       height: 250,
                    //       child: Image.asset(
                    //         'assets/icf01.jpg',
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //     Positioned(
                    //       left: 15,
                    //       right: 15,
                    //       bottom: 15,
                    //       child: Container(
                    //         padding: EdgeInsets.all(5),
                    //         color: Colors.black54,
                    //         child: Text(
                    //           'Pastores Presidentes\nPr. Salmo Diomar\nPra. Cassia Vilela',
                    //           style: GoogleFonts.roboto(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 16,
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),

                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 5, right: 10),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'VÍDEOS',
                              style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 22, 125, 127),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) {
                                      return VideosScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Ver mais',
                                style: GoogleFonts.poppins(
                                    color: Color.fromARGB(255, 22, 125, 127),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Videos
                    //VideoWidget(),

                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 5, right: 10),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'VÍDEOS MANANCIAL',
                              style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 22, 125, 127),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) {
                                      return VideosScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Ver mais',
                                style: GoogleFonts.poppins(
                                    color: Color.fromARGB(255, 22, 125, 127),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Videos Manancial
                    //VideoWidget(),

                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 5, right: 10),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'VÍDEOS CATEDRAL KIDS',
                              style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 22, 125, 127),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) {
                                      return VideosScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Ver mais',
                                style: GoogleFonts.poppins(
                                    color: Color.fromARGB(255, 22, 125, 127),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Videos Catedral Kids
                    //VideoWidget(),

                    //Destaques
                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'DESTAQUES',
                          style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 22, 125, 127),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    CarouselWidget(),

                    SizedBox(
                      height: 20,
                    ),

                    //Grupo Familiar
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        bottom: 5,
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'GRUPO FAMILIAR',
                          style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 22, 125, 127),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) {
                                return SearchGrupoScreen();
                              },
                            ),
                          );
                        },
                        child: Card(
                          elevation: 2,
                          shadowColor: Colors.grey.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/group.svg',
                                  height: 60,
                                  width: 60,
                                  color: Color.fromARGB(255, 22, 125, 127),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'ENCONTRE UM GRUPO',
                                  style: GoogleFonts.poppins(
                                      color: Color.fromARGB(255, 22, 125, 127),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
      );

  // showDialogBox() => showCupertinoDialog<String>(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoAlertDialog(
  //         title: Text('Sem conexão!'),
  //         content: Text('Por favor, verifique sua internet'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {},
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );

}
