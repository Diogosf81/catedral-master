import 'package:catedral/app/screens/biblia/chapter_page.dart';
import 'package:catedral/app/screens/biblia/models/book.dart';
import 'package:catedral/app/screens/biblia/services/books_bloc.dart';
import 'package:flutter/material.dart';


Future push(BuildContext context, Widget page) {
  return Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
        return page;
      }));
}

void goHome(BuildContext context) {
  Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
}


void goBooks(BuildContext context) {
  Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
}

goChapter(context, verse) async {
  BooksBloc bloc = BooksBloc();
  try {
    List<Book>? books = await bloc.book(verse.bookID);
    push(
      context,
      ChapterPage(verse.chapter, 0, books!, verse.verseTxt),
    );
  } catch (e) {
    return Center(child: Text("Erro ao exibir o capítulo."));
  }
}