import 'package:cloud_firestore/cloud_firestore.dart';

class Day{

  Day.fromDocument(DocumentSnapshot document){
    id = document.id;
    dia = document['dia'] as String;
    evento = document['evento'] as String;
  }

  late String id;
  late String dia;
  late String evento;
}