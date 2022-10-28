import 'dart:io';
import 'package:catedral/app/screens/abm/abm_screen.dart';
import 'package:catedral/app/screens/biblia/books_list_page.dart';
import 'package:catedral/app/screens/biblia/utils/constants.dart';
import 'package:catedral/app/screens/calendario/calendario_screen.dart';
import 'package:catedral/app/screens/dizimos_screen.dart';
import 'package:catedral/app/screens/fale_conosco/fale_conosco_screen.dart';
import 'package:catedral/app/screens/igreja/igreja_screen.dart';
import 'package:catedral/app/screens/ministerios/ministerios_screen.dart';
import 'package:catedral/app/screens/search_grupo/search_grupo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../faculdade_catedral/fcf_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Color corQuadrado = Colors.white70;
  Color imageFundo = Color.fromARGB(82, 152, 215, 194);
  Color backgroundButton = Color.fromARGB(255, 22, 125, 127);

  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) =>
      // WillPopScope(
      // onWillPop: () async {
      //   final shouldPop = await showMyDialog();
      //   return shouldPop ?? false;
      // },
      // child:
      Scaffold(
        backgroundColor: Colors.white10,
        //AppBar
        appBar: AppBar(
            //centerTitle: true,
            title: Text(
              'Mais',
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
            //textAlign: TextAlign.left,
            // style: TextStyle(color: Color.fromARGB(255, 22, 125, 127),),),
            //elevation: 0,

            automaticallyImplyLeading: false,
            // leading: IconButton(
            //     icon: Icon(
            //       Icons.logout,
            //       color: Color.fromARGB(255, 22, 125, 127),
            //     ),
            //     onPressed: () {
            //       //Navigator.of(context).pop();
            //       showMyDialog();
            //     }),
            actions: [
              // IconButton(
              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) {
              //         return LoginScreen();
              //       }));
              //       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //       //   content: Text('Login do usuário em breve!'),
              //       //   duration: Duration(seconds: 2),
              //       //   backgroundColor: Colors.black,
              //       // ));
              //     },
              //     icon: Icon(
              //       Icons.account_circle,
              //       color: Color.fromARGB(255, 22, 125, 127),
              //       size: 35,
              //     ))
              // IconButton(
              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) {
              //         return RadioScreen();
              //       }));
              //       // ScaffoldMessenger.of(context).showSnackBar(
              //       //     SnackBar(content:
              //       //     Text(
              //       //         'Em breve, Rádio Catedral da Família'),
              //       //       duration: Duration(seconds: 2),
              //       //       backgroundColor: Colors.black,
              //       //     ));
              //     },
              //     icon: Icon(
              //       Icons.radio,
              //       color: Color.fromARGB(255, 22, 125, 127),
              //     )),
              //   IconButton(
              //       onPressed: () {
              //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //           content: Text('Notificações'),
              //           duration: Duration(seconds: 2),
              //           backgroundColor: Colors.black,
              //         ));
              //       },
              //       icon: Icon(
              //         Icons.notifications,
              //         color: Color.fromARGB(255, 22, 125, 127),
              //       )),
            ],
            backgroundColor: Colors.white,
            // title: Image.asset(
            //   'assets/logo_catedral.png',
            //   fit: BoxFit.contain,
            //   height: 90,
            //   width: 90,
            // ),
        ),

        //Body
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //1
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        //Ministérios
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 5, right: 5, top: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (ctx) {
                                return MinisteriosScreen();
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 22, 125, 127),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 20,
                                      left: 90,
                                      child: SvgPicture.asset(
                                        'assets/svg/ministerios.svg',
                                        height: 90,
                                        width: 90,
                                        color:
                                            Color.fromARGB(82, 152, 215, 194),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                              'assets/svg/ministerios.svg',
                                              color: const Color.fromARGB(
                                                  255, 22, 125, 127),
                                            ),
                                          ),
                                        ),
                                        Text('Ministérios',
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 95,
                            ),
                          ),
                        ),

                        //Eventos
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 5, right: 5, bottom: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const CalendarioScreen();
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: backgroundButton,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 20,
                                      left: 80,
                                      child: SvgPicture.asset(
                                        'assets/svg/calendar.svg',
                                        height: 90,
                                        width: 90,
                                        color:
                                            Color.fromARGB(82, 152, 215, 194),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                              'assets/svg/calendar.svg',
                                              color: const Color.fromARGB(
                                                  255, 22, 125, 127),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 152,
                                          child: Text('Eventos',
                                              maxLines: 2,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 95,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  //Sobre a Igreja
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, top: 20, bottom: 5, right: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return IgrejaScreen();
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 22, 125, 127),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 10,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: SvgPicture.asset(
                                        'assets/svg/heart.svg',
                                        color:
                                            Color.fromARGB(255, 22, 125, 127),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 35,
                                  left: 60,
                                  child: SvgPicture.asset(
                                    'assets/svg/heart.svg',
                                    height: 140,
                                    width: 140,
                                    color: Color.fromARGB(82, 152, 215, 194),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  child: Text('A Igreja',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Bíblia
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 5, right: 20, top: 5),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                            return BooksListPage(Testament.ALL);
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(
                                  255, 22, 125, 127),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 20,
                                  left: 290,
                                  child: SvgPicture.asset(
                                    'assets/svg/bible.svg',
                                    height: 90,
                                    width: 90,
                                    color: Color.fromARGB(82, 152, 215, 194),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                          'assets/svg/bible.svg',
                                          color: const Color.fromARGB(
                                              255, 22, 125, 127),
                                        ),
                                      ),
                                    ),
                                    Text(
                                        'Bíblia',
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 95,
                        ),
                      ),
                    ),
                  ),

                  // Expanded(
                  //   flex: 1,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(
                  //         left: 20, top: 20, bottom: 10, right: 10),
                  //     child: GestureDetector(
                  //       onTap: () {
                  //         Navigator.push(context,
                  //             MaterialPageRoute(builder: (context) {
                  //           return const IgrejaScreen();
                  //         }));
                  //       },
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //             color: Color.fromARGB(255, 239, 239, 239),
                  //             borderRadius: BorderRadius.circular(10)),
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 20),
                  //           child: Stack(
                  //             children: [
                  //               Positioned(
                  //                 top: 10,
                  //                 child: SvgPicture.asset(
                  //                   'assets/svg/heart.svg',
                  //                   height: 56,
                  //                   width: 56,
                  //                   color:
                  //                       const Color.fromARGB(255, 22, 125, 127),
                  //                 ),
                  //               ),
                  //               Positioned(
                  //                 bottom: 10,
                  //                 child: Text(
                  //                   '',
                  //                   textAlign: TextAlign.start,
                  //                   style: TextStyle(
                  //                       fontSize: 18,
                  //                       color: const Color.fromARGB(
                  //                           255, 22, 125, 127),
                  //                       fontWeight: FontWeight.bold),
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //         width: MediaQuery.of(context).size.width,
                  //         height: 200,
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //ABM
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 5, bottom: 5, right: 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return AbmScreen();
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 22, 125, 127),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 10,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: SvgPicture.asset(
                                        'assets/svg/abm.svg',
                                        color:
                                            Color.fromARGB(255, 22, 125, 127),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  left: 40,
                                  child: SvgPicture.asset(
                                    'assets/svg/abm.svg',
                                    height: 170,
                                    width: 170,
                                    color: Color.fromARGB(82, 152, 215, 194),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  child: Text('ABM',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                        ),
                      ),
                    ),
                  ),

                  //Grupo Famliar
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 5, right: 20, bottom: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const SearchGrupoScreen();
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 22, 125, 127),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 20,
                                      left: 90,
                                      child: SvgPicture.asset(
                                        'assets/svg/group.svg',
                                        height: 80,
                                        width: 80,
                                        color:
                                            Color.fromARGB(82, 152, 215, 194),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: SvgPicture.asset(
                                              'assets/svg/group.svg',
                                              color: Color.fromARGB(
                                                  255, 22, 125, 127),
                                            ),
                                          ),
                                        ),
                                        Text('Grupo Familiar',
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 95,
                            ),
                          ),
                        ),

                        //Contribua
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 5, right: 20, bottom: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (ctx) {
                                return DizimosScreen();
                              }));
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return const CalendarioScreen();
                              // }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 22, 125, 127),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 15,
                                      left: 90,
                                      child: SvgPicture.asset(
                                        'assets/svg/money.svg',
                                        height: 90,
                                        width: 90,
                                        color:
                                            Color.fromARGB(82, 152, 215, 194),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                              'assets/svg/money.svg',
                                              color: const Color.fromARGB(
                                                  255, 22, 125, 127),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 152,
                                          child: Text('Contribua',
                                              maxLines: 2,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 95,
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
                  //FCF
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 5, right: 5, bottom: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (ctx) {
                                return FcfScreen();
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 22, 125, 127),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 20,
                                      left: 100,
                                      child: SvgPicture.asset(
                                        'assets/svg/fcf.svg',
                                        height: 80,
                                        width: 80,
                                        color:
                                            Color.fromARGB(82, 152, 215, 194),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                              'assets/svg/fcf.svg',
                                              color: const Color.fromARGB(
                                                  255, 22, 125, 127),
                                            ),
                                          ),
                                        ),
                                        Text('FCF',
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 95,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Fale Conosco
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, bottom: 5, right: 20, top: 5),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                            return FaleConoscoScreen();
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(
                                  255, 22, 125, 127),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 20,
                                  left: 90,
                                  child: SvgPicture.asset(
                                    'assets/svg/contact.svg',
                                    height: 90,
                                    width: 90,
                                    color: Color.fromARGB(82, 152, 215, 194),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                          'assets/svg/contact.svg',
                                          color: const Color.fromARGB(
                                              255, 22, 125, 127),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Fale conosco',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                      )
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 95,
                        ),
                      ),
                    ),
                  )
                ],
              ),

              Row(
                children: [
                  //Instagram
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 5, right: 5, top: 5),
                      child: GestureDetector(
                        onTap: openInstagram,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 22, 125, 127),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      'assets/svg/instagram.svg',
                                      color: const Color.fromARGB(
                                          255, 22, 125, 127),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Instagram',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 47.5,
                        ),
                      ),
                    ),
                  ),

                  //FaceBook
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, bottom: 5, right: 20, top: 5),
                      child: GestureDetector(
                        onTap: openFacebook,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 22, 125, 127),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      'assets/svg/facebook.svg',
                                      color: const Color.fromARGB(
                                          255, 22, 125, 127),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Facebook',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 47.5,
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
      );

  Future<bool?> showMyDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Deseja realmente sair?'),
            actions: [
              TextButton(
                  child: Text('CANCELAR'),
                  onPressed: () => Navigator.pop(context, false)),
              TextButton(
                  child: Text('SIM'),
                  onPressed: () {
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
