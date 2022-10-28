import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class FaleConoscoScreen extends StatelessWidget {
  FaleConoscoScreen({Key? key}) : super(key: key);

  final TextEditingController _controllerSubject = TextEditingController();
  final TextEditingController _controllerBody = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        title: Text(
          'Fale conosco',
          style: GoogleFonts.roboto(
            fontSize: 18,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controllerSubject,
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 25, 29, 59),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 25, 29, 59),
                        ),
                      ),
                      labelText: 'Assunto',
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _controllerBody,
                    maxLines: 10,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 25, 29, 59),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 25, 29, 59),
                          ),
                        ),
                        labelText: 'Mensagem',
                        labelStyle: TextStyle(color: Colors.grey)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 22, 125, 127),
                      ),
                      onPressed: () async {
                        if (_controllerSubject.text.isEmpty ||
                            _controllerBody.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.redAccent,
                              content: Text('Digite o assunto e a mensagem!'),
                            ),
                          );
                        } else {
                          String? encodeQueryParameters(
                              Map<String, String> params) {
                            return params.entries
                                .map((MapEntry<String, String> e) =>
                                    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                .join('&');
                          }

                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'secretaria.catedraldafamilia@gmail.com',
                            query: encodeQueryParameters(
                              <String, String>{
                                'subject': '${_controllerSubject.text}',
                                'body': '${_controllerBody.text}',
                              },
                            ),
                          );

                          if (await canLaunch(emailLaunchUri.toString())) {
                            launch(emailLaunchUri.toString());
                          } else {
                            print(
                                "Esta ação não é suportada. Sem email no app.");
                          }

                          launchUrl(emailLaunchUri);
                          _controllerBody.text = '';
                          _controllerSubject.text = '';
                        }
                      },
                      child: Text(
                        'Enviar',
                        style: GoogleFonts.montserrat(fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
