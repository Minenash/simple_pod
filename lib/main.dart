import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:simple_pod/AppTheme.dart';
import 'package:simple_pod/screens/Player.dart';
import 'package:simple_pod/screens/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
  ));
  runApp(Main());
}

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();

  static setState(Function fn) => _MainState.state.setState(fn);
}

class _MainState extends State<Main> {

  static _MainState state;

  @override
  void initState() {
    super.initState();
    state = this;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podcast App',
      debugShowCheckedModeBanner: false,
      theme:
      ThemeData(
        appBarTheme: AppBarTheme(
          color: AppTheme.raised,
          textTheme: TextTheme(title: TextStyle(color: AppTheme.primary, fontSize: 20, fontWeight: FontWeight.w500)),
          iconTheme: IconThemeData(color: AppTheme.primary),
          elevation: 0,
        ),
        scaffoldBackgroundColor: AppTheme.background,
        textTheme: TextTheme(body1: TextStyle(color: AppTheme.primary)),
        iconTheme: IconThemeData(
            color: AppTheme.primary
        ),
        sliderTheme: SliderThemeData(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
            trackHeight: 4
        ),
      ),
      routes: {
        '/'         : (context) => MyHomePage(),
        '/home/podcasts' : (context) => HomeScreen(),
        '/home/playlists': (context) => HomeScreen(),
        '/home/settings' : (context) => HomeScreen(),
        '/player'        : (context) => PlayerScreen(),
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
