import 'package:catedral/app/components/calendar_list_tile.dart';
import 'package:catedral/app/models/calendar_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarioScreen extends StatefulWidget {
  const CalendarioScreen({Key? key}) : super(key: key);

  @override
  _CalendarioScreenState createState() => _CalendarioScreenState();
}

class _CalendarioScreenState extends State<CalendarioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 22, 125, 127),
        title: Text('CALENDÁRIO ${DateTime.now().year}',
            style: GoogleFonts.montserrat(
                color: const Color.fromARGB(255, 22, 125, 127),
                fontWeight: FontWeight.bold,
                fontSize: 22)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer<CalendarManager>(
        builder: (_, calendarManager, __){
          return ListView.builder(
            padding: const EdgeInsets.all(4),
              itemCount: calendarManager.allCalendar.length,
              itemBuilder: (_, index) {
                return CalendarListTile(calendarManager.allCalendar[index]);
              });
        }
      ),
    );
  }
}
