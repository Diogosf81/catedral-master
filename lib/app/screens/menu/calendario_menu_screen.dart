import 'package:catedral/app/models/calendar_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarioMenu extends StatefulWidget {
  const CalendarioMenu({Key? key}) : super(key: key);

  @override
  _CalendarioMenuState createState() => _CalendarioMenuState();
}

class _CalendarioMenuState extends State<CalendarioMenu> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
      Future.delayed(const Duration(seconds: 2), _test);
    });
  }

  Future _test() async {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text(
            'CATEDRAL DA FAMILIA',
            style: GoogleFonts.raleway(
                color: const Color.fromARGB(255, 22, 125, 127)),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text("CALENDÁRIO 2022",
                  style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 22, 125, 127))),
            ),
            Expanded(
              child: isLoading == true
                  ? Center(
                      child: Container(
                        width: 30,
                        height: 30,
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  : Consumer<CalendarManager>(
                      builder: (_, calendarManager, __) {
                        return ListView.builder(
                            itemCount: calendarManager.allCalendar.length,
                            //itemCount: litems.length,
                            itemBuilder: (_, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) {
                                        //   return EventoScreen(month);
                                        // }));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color.fromARGB(
                                              255, 22, 125, 127),
                                        ),
                                        child: ListTile(
                                          title: Row(
                                            children: [
                                              Text(
                                                  calendarManager
                                                      .allCalendar[index].mes,
                                                  //title: Text(litems.,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              221,
                                                              255,
                                                              231))),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
            ),
          ],
        ));
  }
}
