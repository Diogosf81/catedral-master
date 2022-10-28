import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {

  TextWidget({
    Key? key,
  }) : super(key: key);

  late String text;
  late Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(text,
          style: GoogleFonts.poppins(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}