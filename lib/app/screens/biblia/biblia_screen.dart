import 'package:flutter/material.dart';
import 'package:bible_sqlite/bible_sqlite.dart';

class BibliaScreen extends StatelessWidget {
  BibliaScreen({Key? key}) : super(key: key);

  BibleSqlite _bibleSqlite = BibleSqlite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
      ),
      body: Container(
        child: FutureBuilder<List<BookModel>>(
          future: _bibleSqlite.getBook(),
          builder: (_, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('Carregando dados...'),
                );
              case ConnectionState.waiting:
                return Center(
                  child: Text('Carregando dados...'),
                );
              case ConnectionState.active:
                return Center(
                  child: Text('Carregando dados...'),
                );
              case ConnectionState.done:
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    return Text(snapshot.data![index].name);
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
