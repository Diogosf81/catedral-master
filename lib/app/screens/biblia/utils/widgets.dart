// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:catedral/app/screens/biblia/utils/text_utils.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

Widget centerText(String msg, {color = Colors.redAccent, size = 14.0}) {
  return Center(
    child: Text(
      msg,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

EasyRichText richText(String txt, String? words, double size) {
  List<EasyRichTextPattern> pattern = <EasyRichTextPattern>[];

  if (words != null) {
    List<String> w = words.split(" ");
    for (String f in w) {
      pattern.add(_pattern(f, size));
      pattern.add(_pattern(capitalize(f), size));
    }
  }
  return EasyRichText(
    txt,
    defaultStyle: TextStyle(color: Colors.black, fontSize: size),
    patternList: pattern,
  );
}

_pattern(String fmt, double size) {
  return EasyRichTextPattern(
    targetString: fmt,
    style: TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: size,
    ),
  );
}
