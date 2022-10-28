import 'package:catedral/app/models/month.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarManager extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  CalendarManager() {
    _loadAllCalendar();
  }

  List<Month> allCalendar = [];

  String mes = DateFormat.M().format(DateTime.now());

  Future<void> _loadAllCalendar() async {
    if (mes.length == 1) {
      String ordem = '0' + mes;

      final QuerySnapshot snapshotCalendar = await firestore
          .collection('meses')
          .where('ref', isGreaterThanOrEqualTo: '${ordem}')
          .orderBy('ref')
          .get();

      allCalendar =
          snapshotCalendar.docs.map((d) => Month.fromDocument(d)).toList();
    } else {
      final QuerySnapshot snapshotCalendar =
          await firestore.collection('meses')
              .where('ref', isGreaterThanOrEqualTo: '${mes}')
              .orderBy('ref')
              .get();

      allCalendar =
          snapshotCalendar.docs.map((d) => Month.fromDocument(d)).toList();
    }

    notifyListeners();
  }
}
