import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DizimosScreen extends StatelessWidget {
  const DizimosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Color.fromARGB(255, 22, 125, 127),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'DÍZIMOS E OFERTAS',
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                    fontSize: 40,
                    color: Color.fromARGB(255, 22, 125, 127),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Faça a sua contribuição finaceira pelos nosso canais digitais:',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Color.fromARGB(255, 22, 125, 127),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 330,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 152, 215, 194),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Text(
                  'PIX: 06 158 169 0001 50',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Color.fromARGB(255, 22, 125, 127),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 330,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 152, 215, 194),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Text(
                  'Banco do Brasil\nAg.: 4148-3    C.C: 105996-3',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Color.fromARGB(255, 22, 125, 127),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 330,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 152, 215, 194),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Text(
                  'Banco Itaú\nAg.: 4372    C.C: 31031-0',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Color.fromARGB(255, 22, 125, 127),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 330,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 152, 215, 194),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Text(
                  'Banco Bradesco\nAg.: 0140-6 C.C: 11809-5',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Color.fromARGB(255, 22, 125, 127),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  width: 300,
                  child: Text('"Cada um contribua segundo propôs no seu coração; não com tristeza, nem por constrangimento; porque Deus ama ao que dá com alegria".\n2Co. 9.7',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      color: Color.fromARGB(255, 22, 125, 127),
                      fontSize: 16
                    ),
                  ),
              ),
              SizedBox(
                height: 15,
              ),
              Image.asset('assets/logo_catedral.png', width: 150,),
            ],
          ),
        ),
      ),
    );
  }
}
