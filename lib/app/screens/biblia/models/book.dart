import 'dart:convert';
import 'package:catedral/app/screens/biblia/models/entity.dart';

Book booksFromJson(String str) => Book.fromMap(json.decode(str));
String booksToJson(Book data) => json.encode(data.toMap());

class Book extends Entity {
  int testament;
  int bookID;
  String bookName;
  int chapters;
  int seq;
  List<int> markedList = [];

  Book({
    required this.testament,
    required this.bookID,
    required this.bookName,
    required this.chapters,
    required this.seq,
  });

  List<int> get chaptersList => _chaptersList();

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        testament: json["Testament"],
        bookID: json["Book"],
        bookName: json["BookName"],
        chapters: json["Chapters"],
        seq: json["Seq"],
      );

  List<int> _chaptersList() {
    List<int> list = [];
    for (int chapter = 0; chapter < chapters; chapter++) {
      list.add(chapter + 1);
    }
    return list;
  }

  bool isMarked(int i) => markedList.contains(i);

  @override
  Map<String, dynamic> toMap() => {
        "Testament": testament,
        "Book": bookID,
        "BookName": bookName,
        "Chapters": chapters,
        "Seq": seq,
      };

  @override
  String toString() {
    return 'Book{book: $bookID, bookName: $bookName, chapters: $chapters}';
  }
}
