import 'package:catedral/app/models/grupo.dart';
import 'package:catedral/app/screens/grupo/grupo_screen.dart';
import 'package:catedral/app/screens/search_grupo/search_grupo_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GrupoListTile extends StatelessWidget {
  //const GrupoListTile({Key key}) : super(key: key);

  GrupoListTile(this.grupo);

  final Grupo grupo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => GrupoScreen(grupo)));
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 22, 125, 127),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 8),
                        child: Text(
                          grupo.local,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          'DIA: ' + grupo.diasemana,
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 30,
                        width: 30,
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(30),
                        //     color: Colors.white54),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),)
              ],
            ),
          )),
    );
  }
}
