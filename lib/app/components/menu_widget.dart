import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key, required this.texto, required this.color}) : super(key: key);

  final String texto;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 22, 125, 127),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)
          )
      ),
      child: Text(texto,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 21,
            color: color, fontWeight: FontWeight.bold),
      ),
      width: 150,
      height: 190,
    );
  }
}
