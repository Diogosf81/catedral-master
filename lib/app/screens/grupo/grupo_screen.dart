import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:catedral/app/models/grupo.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GrupoScreen extends StatefulWidget {
  GrupoScreen(this.grupo);

  final Grupo grupo;

  @override
  State<GrupoScreen> createState() => _GrupoScreenState();
}

class _GrupoScreenState extends State<GrupoScreen> {

  void _fazerLigacaoAnfitriao() async {
    dynamic url = "tel:+55${widget.grupo.fonea}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new
          Text("Não foi possível ligar para $url"),
            backgroundColor: Colors.redAccent,
          ));
    }
  }

  void _fazerLigacaoLider() async {
    dynamic url = "tel:+55${widget.grupo.fonel}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: new Text("Não foi possível ligar para $url")));
    }
  }

  void _abrirWhatsAppAnfitriao() async {
    var whatsappUrl = "whatsapp://send?phone=+55${widget.grupo.fonea}&text=Olá";
    if (await launch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new Text("Não foi possível acessar o whatsapp do anfitrião! ${widget.grupo.fonea}"),
            backgroundColor: Colors.red));
    }
  }

  void _abrirWhatsAppLider() async {
    var whatsappUrl = "whatsapp://send?phone=+55${widget.grupo.fonel}&text=Olá";
    if (await launch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new Text("Não foi possível acessar o whatsapp do Líder! ${widget.grupo.fonel}"),
              backgroundColor: Colors.red));
    }
  }

  void _abrirGoogleMaps() async {
    dynamic urlMap = "https://www.google.com/maps/search/?api=1&query=${widget.grupo.localizacao}";
    dynamic urlMapApple = "https://maps.apple.com/?q=${Uri.encodeComponent(widget.grupo.localizacao)}&sll=lat,lng";
    if(Platform.isAndroid && widget.grupo.localizacao != ''){
      await launch(urlMap);
    }else if(Platform.isIOS == true && widget.grupo.localizacao != ''){
      await launch(urlMapApple);
    } else {
      throw ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new
          Text("Sem informações da localização!"),
          backgroundColor: Colors.redAccent,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 125, 127),
        title: Text(widget.grupo.local),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 30),
            child: widget.grupo.images == '' ? CircularProgressIndicator() :
            CarouselSlider(
              items: widget.grupo.images
                  .map((url) => ClipRRect(
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: FittedBox(
                      child: Text(
                        'Informações sobre o Grupo Familiar',
                        style: TextStyle(
                            color: Color.fromARGB(255, 22, 125, 127),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  height: 5,
                  color: Color.fromARGB(255, 22, 125, 127),
                ),
                //const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Anfitriões: ${widget.grupo.anfitriao.toUpperCase()}',
                    style: const TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 22, 125, 127),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FittedBox(
                  child: widget.grupo.fonea == ''
                      ? Text('Contato: Telefone não informado!',
                    style: TextStyle(fontSize: 18),)
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Contato: ',
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: _fazerLigacaoAnfitriao,
                        child: Container(
                          height: 30,
                          padding: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 22, 125, 127),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(3.0, 5.0),
                                    blurRadius: 7),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.grupo.fonea,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.play_arrow_outlined,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: _abrirWhatsAppAnfitriao,
                        child: Image.asset(
                          'assets/whatsapp.png',
                          fit: BoxFit.contain,
                          height: 50,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FittedBox(
                  child: Text(
                    'Líder: ${widget.grupo.lider.toUpperCase()}',
                    style: const TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 22, 125, 127),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                FittedBox(
                  child: widget.grupo.fonel == '' ?
                      Text('Contato: ',
                        style: TextStyle(fontSize: 18),)
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Contato: ',
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: _fazerLigacaoLider,
                        child: Container(
                          height: 30,
                          padding: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 22, 125, 127),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(3.0, 5.0),
                                    blurRadius: 7),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.grupo.fonel,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.play_arrow_outlined,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: _abrirWhatsAppLider,
                        child: Image.asset(
                          'assets/whatsapp.png',
                          fit: BoxFit.contain,
                          height: 50,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                widget.grupo.vice == '' ?
                    Text('Vice-líder: Não informado!', style: TextStyle(fontSize: 17),)
                : Text(
                  'Vice-lider: ${widget.grupo.vice}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Endereço: ',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: widget.grupo.endereco == ''
                      ? Text('Endereço não informado!', style: TextStyle(fontSize: 18),)
                      :
                  GestureDetector(
                    onTap: _abrirGoogleMaps,
                    child: Container(
                      height: 40,
                      //width: 350,
                      padding: const EdgeInsets.only(left: 4),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 22, 125, 127),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(3.0, 5.0),
                                blurRadius: 7),
                          ]),
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              widget.grupo.endereco.toUpperCase(),
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.play_arrow_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
