import 'package:catedral/app/screens/biblia/models/book.dart';
import 'package:catedral/app/screens/biblia/models/verse.dart';
import 'package:catedral/app/screens/biblia/services/verse_bloc.dart';
import 'package:catedral/app/screens/biblia/utils/constants.dart';
import 'package:catedral/app/screens/biblia/utils/dialogs.dart';
import 'package:catedral/app/screens/biblia/utils/navigator.dart';
import 'package:catedral/app/screens/biblia/utils/text_utils.dart';
import 'package:flutter/material.dart';

class ChapterPage extends StatefulWidget {

  late List<Book> books;
  late String verseText;
  late Book book;
  int bookID = 0;
  int chapter = 0;
  int idxBook = 0;

  ChapterPage(this.chapter, this.idxBook, this.books, [this.verseText = ""]);

  @override
  _ChapterPageState createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  late ScrollController controller;
  DateTime initRead = DateTime.now();
  DateTime endRead = DateTime.now();
  int qtdVerses = 0;

  VerseBloc _bloc = VerseBloc();
  // FavoritesBloc _favBloc = FavoritesBloc();
  late Book book;

  _ChapterPageState();

  @override
  void initState() {
    super.initState();
    book = widget.books[widget.idxBook];
    _bloc.bookVerses(book.bookID, widget.chapter);
    controller = ScrollController()..addListener(() => _scrollListener());
    //_saveHistory(_favBloc);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  "${book.bookName.toUpperCase()}, CAPÍTULO ${widget.chapter}"),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      goHome(context);
                    })
              ],
            ),
            body: _body(),
          );
        });
  }

  _body() {
    return GestureDetector(
      onHorizontalDragEnd: (details) => _onHorizontalDrag(details),
      child: StreamBuilder(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(child: Text("Erro lendo a lista de versículos."));

          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return _listView(snapshot.data);
        },
      ),
    );
  }

  _listView(verses) {
    qtdVerses = verses.length;
    return Scrollbar(
      child: ListView.builder(
        controller: controller,
        itemCount: qtdVerses,
        itemBuilder: (context, index) => _itemView(context, verses, index),
      ),
    );
  }

  _itemView(context, verses, index) {
    Verse bible = verses[index ?? 0];
    bible.bookName = book.bookName;

    FontWeight weight = (bible.verseTxt == widget.verseText)
        ? FontWeight.bold
        : FontWeight.normal;

    return InkWell(
      onLongPress: () {
        _onLongPress(bible);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Text(
          "${bible.verseID}. ${cleanVerse(bible.verseTxt)}",
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: weight,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  _onHorizontalDrag(details) {
    if (details.primaryVelocity == 0) return;

    // restart tempo de leitura
    initRead = DateTime.now();

    List next = _bloc.nextChapter(
        details, widget.idxBook, widget.chapter, widget.books);
    widget.idxBook = next[0];
    widget.chapter = next[1];
    book = widget.books[widget.idxBook];
    _bloc.bookVerses(book.bookID, widget.chapter);
    PageView.builder(itemBuilder: (context, position) {
      return Container();
    });
  }

  _onLongPress(verse) {
    bottomSheetCopyFavorite(context, verse);
  }

  _scrollListener() async {
    // registra leitura do capítulo
    // Favorite favorite =
    //     Favorite.marked(bookID: book.bookID, chapter: widget.chapter);

    if (controller.position.atEdge) {
      int secs = qtdVerses * 5;

      if (controller.position.pixels != 0) {
        endRead = DateTime.now();
        // if (endRead.difference(initRead) > Duration(seconds: secs)) {
        //   bool marked = await _favBloc.isMarked(favorite);
        //   if (!marked) bottomSheetSaved(context, _favBloc, favorite, book);
        // }
      }
    }
  }

  // _saveHistory(FavoritesBloc bloc) async {
  //   Favorite hist = await bloc.history();
  //   hist.verse.bookID = book.bookID;
  //   hist.verse.chapter = widget.chapter;
  //   bloc.include(hist);
  // }

  @override
  void dispose() {
    controller.dispose();
    _bloc.dispose();
    // _favBloc.dispose();
    super.dispose();
  }
}
