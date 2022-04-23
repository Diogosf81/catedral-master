import 'package:catedral/app/models/day.dart';
import 'package:catedral/app/models/month.dart';
import 'package:catedral/app/screens/evento/evento_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventoManager extends ChangeNotifier {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  EventoManager() {
    _loadAllEvento();
  }

  List<Day> allEvento = [];

  Future<void> _loadAllEvento() async {


    final QuerySnapshot snapshotEvento =
    await firestore.collection('meses').doc('/FEVEREIRO/').collection('datas').orderBy('dia').get();

    allEvento =
        snapshotEvento.docs.map((d) => Day.fromDocument(d)).toList();

    notifyListeners();
  }

}
