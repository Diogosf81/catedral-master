import 'package:cloud_firestore/cloud_firestore.dart';

class Grupo {

  Grupo.fromDocument(DocumentSnapshot document){
    id = document.id;
    anfitriao = document['anfitriao'] as String;
    diasemana = document['diasemana'] as String;
    endereco = document['endereco'] as String;
    fonea = document['fonea'] as String;
    fonel = document['fonel'] as String;
    lider = document['lider'] as String;
    local = document['local'] as String;
    vice = document['vice'] as String;
    localizacao = document['localizacao'] as String;
    images = List<String>.from(document['images'] as List<dynamic>);
  }

  late String id;
  late String anfitriao;
  late String diasemana;
  late String endereco;
  late String fonea;
  late String fonel;
  late String lider;
  late String local;
  late String vice;
  late String localizacao;
  late List<dynamic> images;
}