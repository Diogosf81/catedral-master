import 'package:catedral/app/models/month.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventoScreen extends StatefulWidget {
  const EventoScreen(this.month);

  final Month month;

  @override
  State<EventoScreen> createState() => _EventoScreenState();
}

class _EventoScreenState extends State<EventoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 22, 125, 127),
        title: Text(
          widget.month.mes,
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('meses')
            .doc('/${widget.month.mes}/')
            .collection('datas')
            .orderBy('dia', descending: false)
            .snapshots(),
        builder: (_, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: const EdgeInsets.all(4),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (_, index) {
                    return Card(
                      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: snapshot.data.docs[index].data()['dia'] ==
                              DateFormat.d('pt_BR').format(DateTime.now()).padLeft(2, '0')
                              ? const Color.fromARGB(255, 22, 125, 127)
                              : const Color.fromARGB(255, 221, 255, 231),
                        ),
                        height: 60,
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${snapshot.data.docs[index].data()['dia']} - ${snapshot.data.docs[index].data()['evento'].toString().toUpperCase()}',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: snapshot.data.docs[index]
                                              .data()['dia'] ==
                                      DateFormat.d('pt_BR').format(DateTime.now()).padLeft(2, '0')
                                      ? const Color.fromARGB(
                                          255, 221, 255, 231)
                                      : const Color.fromARGB(
                                          255, 22, 125, 127),
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
