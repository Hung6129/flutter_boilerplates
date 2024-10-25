import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

extension StringExt on String {
  Color get hexToColor => Color(
        int.parse(toLowerCase().substring(1, 7), radix: 16) + 0xFF000000,
      );

  bool get isURL => isNotEmpty && Uri.parse(this).isAbsolute;

  String get path => p.extension(this);

  double getWidthByStyle(TextStyle textStyle) {
    final textSpan = TextSpan(
      text: this,
      style: textStyle,
    );
    final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    tp.layout();

    return tp.width;
  }
}
