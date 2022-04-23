import 'package:catedral/app/models/day.dart';
import 'package:catedral/app/screens/evento/evento_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/month.dart';

class CalendarListTile extends StatelessWidget {
  CalendarListTile(this.month);

  final Month month;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //print(DateFormat.MMMM('pt_Br').format(DateTime.now()));
        //print(DateTime.now().day);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EventoScreen(month);
        }));
      },
      child: Card(
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: month.mes.toLowerCase() == DateFormat.MMMM('pt_Br').format(DateTime.now())
                ? const Color.fromARGB(255, 221, 255, 231)
                : const Color.fromARGB(255, 22, 125, 127),
          ),
          height: 50,
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Text(
                month.mes,
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: month.mes.toLowerCase() == DateFormat.MMMM('pt_Br').format(DateTime.now())
                        ? const Color.fromARGB(255, 22, 125, 127)
                        : const Color.fromARGB(255, 221, 255, 231),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
