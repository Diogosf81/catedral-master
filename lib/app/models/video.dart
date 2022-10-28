class Video {
  late String id;
  late String titulo;
  late String descricao;
  late String imagem;
  late String canal;

  Video({required this.id,
    required this.titulo,
    required this.descricao,
    required this.imagem,
    required this.canal});

  /*
  static converterJson(Map<String, dynamic> json) {
    return Video(
        id: json["id"]["videoId"],
        imagem: json["snippet"]["thumbnails"]["high"]["url"],
        titulo: json["snippet"]["title"],
        descricao: '',
        canal: json["snippet"]["channelId"]
    );
  }*/

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        id: json["id"]["videoId"],
        imagem: json["snippet"]["thumbnails"]["high"]["url"],
        titulo: json["snippet"]["title"],
        descricao: json["snippet"]["description"],
        canal: json["snippet"]["channelId"]
    );
  }
}
