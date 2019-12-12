import 'package:flutter/material.dart';

class eText extends Text{

  eText(String text, {Color color, FontWeight weight, double size, TextAlign align, bool italic, bool bold, int wrap}) : super(text,
    textAlign: align,
    style: TextStyle(
      color: color,
      fontWeight: weight ?? (bold != null && bold ? FontWeight.bold : FontWeight.normal),
      fontSize: size,
      fontStyle: italic != null && italic? FontStyle.italic : FontStyle.normal,
    ),
    maxLines: wrap == null ? 1 : (wrap == -1 ? 9223372036854775806 : wrap),
    overflow: TextOverflow.ellipsis
  );
}