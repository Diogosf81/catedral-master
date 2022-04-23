import 'package:cloud_firestore/cloud_firestore.dart';

class Month{

  Month.fromDocument(DocumentSnapshot document){
    id = document.id;
    mes = document['mes'] as String;
    ref = document['ref'] as String;
  }

  late String id;
  late String mes;
  late String ref;
}