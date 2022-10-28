import 'package:catedral/app/screens/biblia/chapter_page.dart';
import 'package:catedral/app/screens/biblia/models/book.dart';
import 'package:catedral/app/screens/biblia/search_page.dart';
import 'package:catedral/app/screens/biblia/utils/constants.dart';
import 'package:catedral/app/screens/biblia/utils/navigator.dart';
import 'package:catedral/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChaptersListPage extends StatefulWidget {
  final idxBook;
  final List<Book> books;

  ChaptersListPage(this.books, this.idxBook);

  @override
  _ChaptersListPageState createState() => _ChaptersListPageState();
}

class _ChaptersListPageState extends State<ChaptersListPage> {
  late Book book;
  late List<int> chaptersList;

  @override
  void initState() {
    book = widget.books[widget.idxBook];
    //booksBloc.markedChapters(book);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.bookName),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 25,
              color: background,
            ),
            onPressed: () {
              push(context, SearchPage());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.home,
              size: 25,
              color: background,
            ),
            onPressed: () {
              goHome(context);
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 15, right: 10, bottom: 0),
          child: Text(
            "CAPÍTULOS",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Flexible(
          flex: 1,
          child: StreamBuilder(
              stream: booksBloc.stream, // ,
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return Center(child: Text("Erro lendo a lista de capítulos."));

                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());

                return GridView.builder(
                  itemCount: book.chapters,
                  padding: EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemBuilder: (context, index) => _itemView(context, index),
                );
              }),
        ),
      ],
    );
  }

  _itemView(context, index) {
    int chapter = (book == null) ? 0 : book.chaptersList[index];

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 1),
            blurRadius: 2,
          )
        ], borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: InkWell(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Text(
                "$chapter",
                style: TextStyle(
                  color:
                      book.isMarked(chapter) ? Colors.blueAccent : Colors.black,
                  fontSize: fontSize,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          onTap: () {
            push(context, ChapterPage(chapter, widget.idxBook, widget.books));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
