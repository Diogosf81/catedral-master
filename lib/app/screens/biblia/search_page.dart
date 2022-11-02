// ignore_for_file: import_of_legacy_library_into_null_safe, must_be_immutable, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:catedral/app/screens/biblia/chapter_page.dart';
import 'package:catedral/app/screens/biblia/models/book.dart';
import 'package:catedral/app/screens/biblia/models/verse.dart';
import 'package:catedral/app/screens/biblia/services/books_bloc.dart';
import 'package:catedral/app/screens/biblia/services/verse_bloc.dart';
import 'package:catedral/app/screens/biblia/utils/constants.dart';
import 'package:catedral/app/screens/biblia/utils/dialogs.dart';
import 'package:catedral/app/screens/biblia/utils/navigator.dart';
import 'package:catedral/app/screens/biblia/utils/widgets.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  Testament? testament;
  SearchPage([this.testament]);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  final VerseBloc _bloc = VerseBloc();
  final BooksBloc _booksBloc = BooksBloc();
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    String title = "Pesquisar";
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: accent,
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home,
              color: inverse,
            ),
            onPressed: () => goHome(context),
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: _inputSearch(),
        ),
        Flexible(
          flex: 4,
          fit: FlexFit.tight,
          child: _showVerses(),
        )
      ],
    );
  }

  _inputSearch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            child: TextField(
              controller: _controller,
              onSubmitted: (s) {
                _isSearching = true;
                _bloc.versesByWord(_controller.text);
              },
              autofocus: true,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: primary,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.search,
            color: primary,
            size: 26,
          ),
          onPressed: () {
            _isSearching = true;
            _bloc.versesByWord(_controller.text);
          },
        )
      ],
    );
  }

  _showVerses() {
    List<Verse>? verses;
    return StreamBuilder(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return centerText(
              "Erro lendo a lista de versículos.",
            );
          }

          if (!snapshot.hasData && _isSearching) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          verses = snapshot.data as List<Verse>?;

          if (verses == null) {
            return centerText(
              "Informe a palavra a ser pesquisada.",
              color: Colors.black,
            );
          }

          if (verses != null && verses!.isEmpty) {
            return centerText("Palavra não encontrada!");
          }

          return _listView(verses);
        });
  }

  _listView(verses) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: verses.length,
        itemBuilder: (context, index) => _itemView(context, verses, index),
      ),
    );
  }

  _itemView(context, verses, index) {
    Verse verse = verses[index];
    String search = _controller.text;

    double size = fontSize - 2;
    EasyRichText verseTagged = richText(verse.verseTxt!, search, size);

    return ListTile(
      contentPadding: const EdgeInsets.only(left: 16, right: 12),
      title: Text(
        verse.reference(),
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: verseTagged,
      onLongPress: (() {
        bottomSheetCopyFavorite(context, verse);
      }),
      onTap: (() {
        _showChapter(verse);
      }),
    );
  }

  _showChapter(Verse verse) async {
    try {
      List<Book>? books = await _booksBloc.book(verse.bookID);
      push(
        context,
        ChapterPage(verse.chapter, 0, books!, verse.verseTxt!),
      );
    } catch (e) {
      return centerText("Erro ao exibir o capítulo.");
    }
  }

  @override
  void dispose() {
    _bloc.dispose();
    _booksBloc.dispose();
    super.dispose();
  }
}
