import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IgrejaScreen extends StatelessWidget {
  const IgrejaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme:
          const IconThemeData(color: Color.fromARGB(255, 22, 125, 127)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 239, 239, 239),
          title: Image.asset(
            'assets/logo_catedral.png',
            fit: BoxFit.contain,
            height: 90,
            width: 90,
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nossos Pilares:',
                  style: GoogleFonts.raleway(
                      fontSize: 35,
                      color: Color.fromARGB(255, 22, 125, 127),
                      fontWeight: FontWeight.bold)),
              Text(
                '"Sólida na Palavra de Deus"',
                style: GoogleFonts.raleway(
                    fontSize: 25, color: Color.fromARGB(255, 22, 125, 127)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  'Cuidamos da sua família com amor, palavra, união, Deus.',
                  style: GoogleFonts.raleway(
                      fontSize: 20, color: Color.fromARGB(255, 22, 125, 127), fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('> Santa na Oração',style: GoogleFonts.raleway(
                  fontSize: 20, color: Color.fromARGB(255, 22, 125, 127),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('> Unida em Família',style: GoogleFonts.raleway(
                  fontSize: 20, color: Color.fromARGB(255, 22, 125, 127),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('> Amorosa no Companheirismo',style: GoogleFonts.raleway(
                  fontSize: 20, color: Color.fromARGB(255, 22, 125, 127),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('> Participativa Através dos Grupos Familiares',style: GoogleFonts.raleway(
                  fontSize: 20, color: Color.fromARGB(255, 22, 125, 127),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('> Vencedora pela Fé em Jesus Cristo',style: GoogleFonts.raleway(
                  fontSize: 20, color: Color.fromARGB(255, 22, 125, 127),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
