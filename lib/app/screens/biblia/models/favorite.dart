import 'dart:convert';
import 'package:catedral/app/screens/biblia/models/entity.dart';
import 'package:catedral/app/screens/biblia/models/verse.dart';
import '../utils/constants.dart';

Favorite favoritesFromJson(String str) => Favorite.fromMap(json.decode(str));
String favoritesToJson(Favorite data) => json.encode(data.toMap());

class Favorite extends Entity {
  late int type;
  late Verse verse;

  Favorite.of(Verse v) {
    type = FavoriteType.MINE.index;
    verse = v;
  }

  Favorite.marked({bookID, chapter}) {
    Verse verse = Verse(bookID: bookID, chapter: chapter);
    verse.verseID = 1;
    type = FavoriteType.MARKED.index;
    verse = verse;
  }

  Favorite({required this.type, required this.verse});

  factory Favorite.fromMap(Map<String, dynamic> json) => Favorite(
        type: json["Type"],
        verse: Verse.fromMap(json),
      );

  @override
  Map<String, dynamic> toMap() => {
        "Type": type,
        "Book": verse.bookID,
        "Chapter": verse.chapter,
        "Verse": verse.verseID
      };

  @override
  String toString() {
    return 'Favorite{type: $type, ${verse.toString()}}';
  }
}
