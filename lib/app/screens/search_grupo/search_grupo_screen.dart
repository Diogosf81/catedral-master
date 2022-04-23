import 'package:catedral/app/components/grupo_list_tile.dart';
import 'package:catedral/app/components/search_dialog.dart';
import 'package:catedral/app/models/grupos_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchGrupoScreen extends StatefulWidget {
  const SearchGrupoScreen({Key? key}) : super(key: key);

  @override
  _SearchGrupoScreenState createState() => _SearchGrupoScreenState();
}

class _SearchGrupoScreenState extends State<SearchGrupoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 22, 125, 127)),
        title: Consumer<GruposManager>(
          builder: (_, grupoManager, __) {
            if (grupoManager.search.isEmpty) {
              return Text(
                'GRUPO FAMILIAR',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Color.fromARGB(255, 22, 125, 127),
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
              );
            } else {
              return LayoutBuilder(builder: (_, constraints) {
                return GestureDetector(
                  onTap: () async {
                    final search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(grupoManager.search));
                    if (search != null) {
                      grupoManager.search = search;
                    }
                  },
                  child: Container(
                      width: constraints.biggest.width,
                      child: Text(
                        grupoManager.search,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color.fromARGB(255, 22, 125, 127)),
                      )),
                );
              });
            }
          },
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        actions: [
          Consumer<GruposManager>(builder: (_, grupoManager, __) {
            if (grupoManager.search.isEmpty) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  final search = await showDialog<String>(
                      context: context,
                      builder: (_) => SearchDialog(grupoManager.search));
                  if (search != null) {
                    grupoManager.search = search;
                  }
                },
              );
            } else {
              return IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () async {
                    grupoManager.search = '';
                  });
            }
          })
        ],
      ),
      body: Consumer<GruposManager>(
        builder: (_, gruposManager, __) {
          final filteredGrupos = gruposManager.filteredGrupos;
          return Container(
            padding: EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 152, 215, 194),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                        itemCount: filteredGrupos.length,
                        itemBuilder: (_, index) {
                          //return Text(gruposManager.allGrupos[index].local.toString());
                          return GrupoListTile(filteredGrupos[index]);
                        })
                   ),
          );
        },
      ),
    );
  }
}
