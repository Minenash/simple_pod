import 'package:flutter/material.dart';

AppThemeProperties AppTheme = AppThemeProperties.dark;

class AppThemeProperties {
  final String name;

  final Color background;
  final Color raised;

  final Color primary;
  final Color secondary;
  final Color tertiary;

  final Color unreadBadge;
  final Color link;

  final Color switchOn;
  final Color switchOffThumb;
  final Color switchOffTrack;

  AppThemeProperties({this.name, this.background, this.raised,
                      this.primary, this.secondary, this.tertiary,
                      this.unreadBadge, this.link,
                      this.switchOn, this.switchOffThumb, this.switchOffTrack});

  static final AppThemeProperties dark = AppThemeProperties(
    name: "Dark",

    background: Colors.grey[850],
    raised: Colors.grey[900],

    primary: Colors.white,
    secondary: Colors.grey[400],
    tertiary: Colors.grey[500],

    unreadBadge: Colors.deepOrange[700],
    link: Colors.orange,

    switchOn: Colors.white,
    switchOffThumb: Colors.grey[700],
    switchOffTrack: Colors.grey[800],
  );

  static final AppThemeProperties grey = AppThemeProperties(
    name: "Grey",

    background: Colors.grey[800],
    raised: Colors.grey[900],

    primary: Colors.white,
    secondary: Colors.grey[400],
    tertiary: Colors.grey[500],

    unreadBadge: Colors.orange[700],
    link: Colors.orange,

    switchOn: Colors.white,
    switchOffThumb: Colors.grey[700],
    switchOffTrack: Colors.grey[800],
  );

  static final AppThemeProperties black = AppThemeProperties(
    name: "Black",

    background: Colors.black,
    raised: Colors.black,

    primary: Colors.grey[400],
    secondary: Colors.grey[500],
    tertiary: Colors.grey[600],

    unreadBadge: Colors.black,
    link: Colors.orange,

    switchOn: Colors.grey[400],
    switchOffThumb: Colors.grey[600],
    switchOffTrack: Colors.grey[700],
  );

  static final AppThemeProperties light = AppThemeProperties(
    name: "Light",

    background: Colors.grey[200],
    raised: Colors.white,

    primary: Colors.black,
    secondary: Colors.grey[800],
    tertiary: Colors.grey[700],

    unreadBadge: Colors.orange,
    link: Colors.orange,

    switchOn: Colors.black,
    switchOffThumb: Colors.grey[300],
    switchOffTrack: Colors.grey[400],
  );

}