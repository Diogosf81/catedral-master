import 'package:catedral/app/screens/biblia/chapter_page.dart';
import 'package:catedral/app/screens/biblia/models/book.dart';
import 'package:catedral/app/screens/biblia/search_page.dart';
import 'package:catedral/app/screens/biblia/services/books_bloc.dart';
import 'package:catedral/app/screens/biblia/utils/constants.dart';
import 'package:catedral/app/screens/biblia/utils/navigator.dart';
import 'package:flutter/material.dart';

class ChaptersListPage extends StatefulWidget {
  final int idxBook;
  final List<Book> books;
  const ChaptersListPage(this.books, this.idxBook, {Key? key})
      : super(key: key);

  @override
  ChaptersListPageState createState() => ChaptersListPageState();
}

class ChaptersListPageState extends State<ChaptersListPage> {
  late Book book;
  late List<int> chaptersList;
  final BooksBloc _bloc = BooksBloc();

  @override
  void initState() {
    book = widget.books[widget.idxBook];
    _bloc.book(book.bookID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.bookName),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 25,
              color: background,
            ),
            onPressed: () {
              push(context, SearchPage());
            },
          ),
          IconButton(
            icon: const Icon(
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
        const Padding(
          padding: EdgeInsets.only(
            left: 20,
            top: 15,
            right: 10,
            bottom: 0,
          ),
          child: Text(
            "CAPÍTULOS",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Flexible(
          flex: 1,
          child: StreamBuilder(
              stream: _bloc.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Erro lendo a lista de capítulos."),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return GridView.builder(
                  itemCount: book.chapters,
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                  itemBuilder: (context, index) => _itemView(context, index),
                );
              }),
        ),
      ],
    );
  }

  _itemView(context, index) {
    int chapter = book.chaptersList[index];

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 1),
              blurRadius: 2,
            )
          ],
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
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
