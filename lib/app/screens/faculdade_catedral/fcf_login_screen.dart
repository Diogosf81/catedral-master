import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FcfLoginScreen extends StatefulWidget {
  const FcfLoginScreen({Key? key}) : super(key: key);

  @override
  State<FcfLoginScreen> createState() => _FcfLoginScreenState();
}

class _FcfLoginScreenState extends State<FcfLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 125, 127),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Faculdade de Teologia',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  'Bem vindo ao seu ambiente virtual de aprendizagem',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Hero(
                tag: 'fcfhero',
                child: SvgPicture.asset(
                  'assets/svg/fcf.svg',
                  color: Color.fromARGB(82, 152, 215, 194),
                  width: 250,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                child: Container(
                  width: 350,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            focusColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.person_outline_rounded,
                              color: Color.fromARGB(255, 152, 215, 194),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: 'Email/CPF'
                          // labelText: 'Senha'
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            focusColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.password,
                              color: Color.fromARGB(255, 152, 215, 194),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: 'Senha'
                          // labelText: 'Senha'
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Usuário ou senha inválido!'),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.redAccent,
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 152, 215, 194)
                          ),
                          child: Text(
                            'ENTRAR',
                            style: GoogleFonts.poppins(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                          child: Text('esqueci minha senha',
                            style: GoogleFonts.poppins(
                              color: Colors.white
                            ),))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
