import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonMenu extends StatelessWidget {
  //ButtonMenu({Key? key}) : super(key: key);

  ButtonMenu(this.color, this.svg);

  Color color = Color.fromARGB(255, 22, 125, 127);
  String svg = 'assets/svg/youtube.svg';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 5, bottom: 5),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return YoutubeAovivoScreen();
          // }));
        },
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Stack(
              children: [
                Positioned(
                  bottom: 20,
                  left: 80,
                  child: SvgPicture.asset(
                    svg,
                    height: 80,
                    width: 80,
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
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/svg/youtube.svg',
                          color: Color.fromARGB(255, 22, 125, 127),
                        ),
                      ),
                    ),
                    Text('Ao Vivo',
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
    );
  }
}
