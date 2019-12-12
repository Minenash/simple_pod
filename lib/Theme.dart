import 'package:flutter/material.dart';

class AppTheme {

  //I'll switch these to const once I've finalised the colors. the [] colors
  // aren't allowed in const, so I have to convert them to Color(hex)
  static final Color background = Colors.grey[850];
  static final Color raised = Colors.grey[900];

  static final Color primary = Colors.white;
  static final Color secondary = Colors.grey[400];
  static final Color tertiary = Colors.grey[500];

  static final Color unreadBadge = Colors.deepOrange[700];

}