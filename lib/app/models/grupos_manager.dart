import 'package:catedral/app/models/grupo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GruposManager extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  GruposManager() {
    _loadAllGrupos();
  }

  List<Grupo> allGrupos = [];

  late String _search = '';

  String get search => _search;

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  List<Grupo> get filteredGrupos {
    final List<Grupo> filteredGrupos = [];

    if (search.isEmpty) {
      filteredGrupos.addAll(allGrupos);
    } else {
      filteredGrupos.addAll(allGrupos
          .where((g) => g.local.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredGrupos;
  }

  Future<void> _loadAllGrupos() async {
    final QuerySnapshot snapshotGrupos =
        await firestore.collection('grupos').orderBy('local').get();

    allGrupos = snapshotGrupos.docs.map((d) => Grupo.fromDocument(d)).toList();

    notifyListeners();
  }
}
