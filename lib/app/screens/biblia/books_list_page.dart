import 'package:catedral/app/screens/biblia/chapters_list_page.dart';
import 'package:catedral/app/screens/biblia/models/book.dart';
import 'package:catedral/app/screens/biblia/search_page.dart';
import 'package:catedral/app/screens/biblia/services/books_bloc.dart';
import 'package:catedral/app/screens/biblia/utils/constants.dart';
import 'package:catedral/app/screens/biblia/utils/navigator.dart';
import 'package:catedral/app/screens/biblia/utils/widgets.dart';
import 'package:flutter/material.dart';

class BooksListPage extends StatefulWidget {
  final Testament testament;

  BooksListPage(this.testament);

  @override
  _BooksListPageState createState() => _BooksListPageState();
}

class _BooksListPageState extends State<BooksListPage> {
  late String title;
  BooksBloc _bloc = BooksBloc();

  @override
  void initState() {
    super.initState();
    _bloc.booksList(widget.testament);
    title = _bloc.booksTitle(widget.testament);
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: background),
            onPressed: () {
              push(context, SearchPage(widget.testament));
            },
          ),
          IconButton(
            icon: Icon(Icons.home, color: inverse),
            onPressed: () => goHome(context),
          ),
        ],
        title: Text("Bíblia"),
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
              const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 15),
          child: Text(
            "LIVROS",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Flexible(
          flex: 1,
          child: StreamBuilder(
              stream: _bloc.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return centerText("Erro lendo a lista de livros.");

                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());

                List<Book>? books = snapshot.data as List<Book>?;

                return Scrollbar(
                  child: ListView.builder(
                    itemExtent: 45,
                    itemCount: (books != null) ? books.length : 0,
                    itemBuilder: (context, index) =>
                        _itemView(context, books, index),
                  ),
                );
              }),
        ),
      ],
    );
  }

  _itemView(context, books, index) {
    Book book = books[index];
    int idxBook = index;

    return GestureDetector(
      onTap: () {
        push(context, ChaptersListPage(books, idxBook));
      },
      child: Container(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  book.bookName,
                  style: TextStyle(fontSize: 18),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                )
              ],
            ),
          ),
          // onTap: () {
          //   push(context, ChaptersListPage(books, idxBook));
          // },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
