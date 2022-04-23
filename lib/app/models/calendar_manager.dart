import 'package:catedral/app/models/month.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CalendarManager extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  CalendarManager() {
    _loadAllCalendar();
  }

  List<Month> allCalendar = [];

  Future<void> _loadAllCalendar() async {
    final QuerySnapshot snapshotCalendar =
        await firestore.collection('meses').orderBy('ref').get();

    allCalendar =
        snapshotCalendar.docs.map((d) => Month.fromDocument(d)).toList();

    notifyListeners();
  }
}
