import 'package:catedral/app/models/day.dart';
import 'package:catedral/app/models/month.dart';
import 'package:catedral/app/screens/evento/evento_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventoListTile extends StatelessWidget {
  EventoListTile(this.day);

  final Day day;

  @override
  Widget build(BuildContext context) {
    return Card(
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color.fromARGB(255, 221, 255, 231),
        ),
        height: 50,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              '111${day.dia} - ${day.evento.toUpperCase()}',
              style: GoogleFonts.poppins(
                  fontSize: 20, color: const Color.fromARGB(255, 22, 125, 127), fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
