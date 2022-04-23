import 'package:cloud_firestore/cloud_firestore.dart';

class Calendar{

  Calendar.fromDocument(DocumentSnapshot document){
    id = document.id;
    data = document['data'] as String;
    evento = document['evento'] as String;
  }

  late String id;
  late String data;
  late String evento;

}