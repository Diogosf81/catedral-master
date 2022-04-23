import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:catedral/app/screens/calendario/calendario_screen.dart';
import 'package:catedral/app/screens/igreja/igreja_screen.dart';
import 'package:catedral/app/screens/search_grupo/search_grupo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) =>
      WillPopScope(
          onWillPop: () async {
            final shouldPop = await showMyDialog();
            return shouldPop ?? false;
          },
          child: Scaffold(
            //floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
            appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                leading: IconButton(
                    icon: Icon(Icons.exit_to_app,
                      color: Color.fromARGB(255, 22, 125, 127),),
                    onPressed: () {
                      showMyDialog();
                    }),
                actions: [
                  IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content:
                            Text(
                                'Em breve, Rádio Catedral da Família'),
                            duration: Duration(seconds: 2),
                              backgroundColor: Colors.black,
                            ));
                      },
                      icon: Icon(Icons.radio,
                        color: Color.fromARGB(255, 22, 125, 127),)),
                  IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content:
                            Text(
                                'Notificações'),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.black,
                            ));
                      },
                      icon: Icon(Icons.notifications,
                        color: Color.fromARGB(255, 22, 125, 127),)),
                ],
                backgroundColor: Colors.transparent,
                title: Image.asset(
                  'assets/logo_catedral.png',
                  fit: BoxFit.contain,
                  height: 90,
                  width: 90,
                )),
            body: SafeArea(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ///1
                      ///Sobre a Igreja
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, bottom: 10, right: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return const IgrejaScreen();
                                  }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 239, 239, 239),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 10,
                                      child: SvgPicture.asset(
                                        'assets/svg/heart.svg',
                                        height: 56,
                                        width: 56,
                                        color:
                                        const Color.fromARGB(255, 22, 125, 127),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      child: Text(
                                        'A Igreja',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: const Color.fromARGB(
                                                255, 22, 125, 127),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 200,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [

                            ///Grupo Famliar
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 20, right: 20, bottom: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return const SearchGrupoScreen();
                                      }));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 239, 239, 239),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/svg/group.svg',
                                          height: 35,
                                          width: 35,
                                          color: const Color.fromARGB(
                                              255, 22, 125, 127),
                                        ),
                                        Text(
                                          'Grupo Familiar',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: const Color.fromARGB(
                                                  255, 22, 125, 127),
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  height: 90,
                                ),
                              ),
                            ),

                            ///Calendário de Eventos
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10, right: 20, bottom: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return const CalendarioScreen();
                                      }));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 239, 239, 239),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/svg/calendar.svg',
                                          height: 35,
                                          width: 35,
                                          color: const Color.fromARGB(
                                              255, 22, 125, 127),
                                        ),
                                        SizedBox(
                                          width: 152,
                                          child: AutoSizeText(
                                            'Calendário de Eventos',
                                            textAlign: TextAlign.start,
                                            maxFontSize: 18,
                                            minFontSize: 12,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: const Color.fromARGB(
                                                    255, 22, 125, 127),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  height: 90,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,

                        ///Instagram
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 10, right: 10, bottom: 10),
                              child: GestureDetector(
                                onTap: openInstagram,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 239, 239, 239),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/svg/instagram.svg',
                                          height: 35,
                                          width: 35,
                                          color: const Color.fromARGB(
                                              255, 22, 125, 127),
                                        ),
                                        Text(
                                          'Instagram',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: const Color.fromARGB(
                                                  255, 22, 125, 127),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  height: 90,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,

                        ///FaceBook
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 10, right: 20, top: 10),
                          child: GestureDetector(
                            onTap: openFacebook,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 239, 239, 239),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/facebook.svg',
                                      height: 35,
                                      width: 35,
                                      color:
                                      const Color.fromARGB(255, 22, 125, 127),
                                    ),
                                    Text(
                                      'Facebook',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: const Color.fromARGB(
                                              255, 22, 125, 127),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 90,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     ///Sobre a Igreja
                  //     Expanded(
                  //       flex: 1,
                  //       child: Column(
                  //         children: [
                  //           ///Bíblia
                  //           Padding(
                  //             padding: const EdgeInsets.only(
                  //                 left: 20, top: 10, right: 10, bottom: 10),
                  //             child: GestureDetector(
                  //               onTap: () {
                  //                 Navigator.push(context,
                  //                     MaterialPageRoute(builder: (context) {
                  //                   return BibliaScreen();
                  //                 }));
                  //               },
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                     color: Color.fromARGB(255, 239, 239, 239),
                  //                     borderRadius: BorderRadius.circular(10)),
                  //                 child: Padding(
                  //                   padding:
                  //                       const EdgeInsets.symmetric(horizontal: 20),
                  //                   child: Stack(
                  //                     children: [
                  //                       Positioned(
                  //                         top: 10,
                  //                         child: SvgPicture.asset(
                  //                           'assets/svg/bible.svg',
                  //                           height: 35,
                  //                           width: 35,
                  //                           color: const Color.fromARGB(
                  //                               255, 22, 125, 127),
                  //                         ),
                  //                       ),
                  //                       Positioned(
                  //                         bottom: 5,
                  //                         child: Text(
                  //                           'Bíblia',
                  //                           textAlign: TextAlign.start,
                  //                           style: TextStyle(
                  //                               fontSize: 18,
                  //                               color: const Color.fromARGB(
                  //                                   255, 22, 125, 127),
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 width: MediaQuery.of(context).size.width,
                  //                 height: 90,
                  //               ),
                  //             ),
                  //           ),
                  //
                  //           ///
                  //           Padding(
                  //             padding: const EdgeInsets.only(
                  //                 left: 20, top: 10, right: 10, bottom: 10),
                  //             child: GestureDetector(
                  //               onTap: () {
                  //                 Navigator.push(context,
                  //                     MaterialPageRoute(builder: (context) {
                  //                   return const CalendarioScreen();
                  //                 }));
                  //               },
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                     color: Color.fromARGB(255, 239, 239, 239),
                  //                     borderRadius: BorderRadius.circular(10)),
                  //                 child: Padding(
                  //                   padding:
                  //                       const EdgeInsets.symmetric(horizontal: 20),
                  //                   child: Stack(
                  //                     children: [
                  //                       Positioned(
                  //                         top: 5,
                  //                         child: SvgPicture.asset(
                  //                           'assets/svg/calendar.svg',
                  //                           height: 35,
                  //                           width: 35,
                  //                           color: const Color.fromARGB(
                  //                               255, 22, 125, 127),
                  //                         ),
                  //                       ),
                  //                       Positioned(
                  //                         bottom: 5,
                  //                         child: SizedBox(
                  //                           width: 152,
                  //                           child: AutoSizeText(
                  //                             '',
                  //                             textAlign: TextAlign.start,
                  //                             maxFontSize: 18,
                  //                             minFontSize: 8,
                  //                             maxLines: 2,
                  //                             style: TextStyle(
                  //                                 fontSize: 18,
                  //                                 color: const Color.fromARGB(
                  //                                     255, 22, 125, 127),
                  //                                 fontWeight: FontWeight.bold),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 width: MediaQuery.of(context).size.width,
                  //                 height: 90,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Expanded(
                  //       flex: 1,
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(
                  //             left: 20, top: 20, bottom: 10, right: 10),
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             Navigator.push(context,
                  //                 MaterialPageRoute(builder: (context) {
                  //               return const IgrejaScreen();
                  //             }));
                  //           },
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //                 color: Color.fromARGB(255, 239, 239, 239),
                  //                 borderRadius: BorderRadius.circular(10)),
                  //             child: Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: 20),
                  //               child: Stack(
                  //                 children: [
                  //                   Positioned(
                  //                     top: 10,
                  //                     child: SvgPicture.asset(
                  //                       'assets/svg/heart.svg',
                  //                       height: 56,
                  //                       width: 56,
                  //                       color:
                  //                           const Color.fromARGB(255, 22, 125, 127),
                  //                     ),
                  //                   ),
                  //                   Positioned(
                  //                     bottom: 10,
                  //                     child: Text(
                  //                       '',
                  //                       textAlign: TextAlign.start,
                  //                       style: TextStyle(
                  //                           fontSize: 18,
                  //                           color: const Color.fromARGB(
                  //                               255, 22, 125, 127),
                  //                           fontWeight: FontWeight.bold),
                  //                     ),
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //             width: MediaQuery.of(context).size.width,
                  //             height: 200,
                  //           ),
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //       content: Text(
            //         'Em breve login de usuários!',
            //         style: GoogleFonts.raleway(
            //             fontSize: 18, fontWeight: FontWeight.bold),
            //       ),
            //       //action: SnackBarAction(label: 'OK', onPressed: () {  },),
            //       duration: Duration(seconds: 4),
            //     ));
            //   },
            //   child: const Icon(Icons.login),
            //   backgroundColor: const Color.fromARGB(255, 22, 125, 127),
            // ),
          ));

  Future<bool?> showMyDialog() =>
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text('Deseja realmente sair?'),
                actions: [
                  TextButton(
                      child: Text('CANCELAR'),
                      onPressed: () => Navigator.pop(context, false)),
                  TextButton(
                      child: Text('SIM'), onPressed: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      exit(0);
                    }
                  }),
                ],
              ));

  void openInstagram() async {
    dynamic url = "https://www.instagram.com/catedraldafamiliasede/";
    if (await launch(url)) {
      await launch(url,
          forceWebView: true, forceSafariVC: true, enableJavaScript: true);
    } else {
      throw 'Não foi possível acessar o Instagram';
    }
  }

  void openFacebook() async {
    dynamic url = "https://www.facebook.com/igrejacatedraldafamilia";
    if (await launch(url)) {
      await launch(url,
          forceWebView: true, forceSafariVC: true, enableJavaScript: true);
    } else {
      throw 'Não foi possível acessar o Facebook';
    }
  }
}
