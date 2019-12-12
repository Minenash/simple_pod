import 'package:flutter/material.dart';
import 'package:simple_pod/Settings.dart';
import 'package:simple_pod/screens/home.dart';
import 'package:simple_pod/widgets/settings.dart';

class SettingsScreen extends StatelessWidget {

  static SettingsPage page = Settings.main;

  static Widget appbar() {
    return AppBar(
      title: Text(page.title),
      leading: page.leading,
      actions: page.actions
    );
  }

  @override
  Widget build(BuildContext c) {
    return Container(
        margin: EdgeInsets.only(bottom: HomeScreen.miniplayerDocked? 68 : 0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: createSettingsScreen(c, SettingsScreen.page.settings),
        )
    );
  }

}








