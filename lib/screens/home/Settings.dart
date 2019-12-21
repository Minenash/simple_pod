import 'package:flutter/material.dart';
import 'package:simple_pod/SettingPages.dart';
import 'package:simple_pod/Settings.dart';
import 'package:simple_pod/screens/home.dart';
import 'package:simple_pod/widgets/settings/all.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();

  static SettingsPage page = SettingPages.main;

  static Widget appbar() {
    return AppBar(
        title: Text(page.title ?? ""),
        leading: page.leading ?? Container(),
        actions: page.actions ?? []
    );
  }

  static setState(Function fn) => _SettingsScreenState.state?.setState(fn);
}

class _SettingsScreenState extends State<SettingsScreen> {

  static _SettingsScreenState state;

  @override
  void initState() {
    super.initState();
    state = this;
  }

  @override
  Widget build(BuildContext c) {
    return WillPopScope(
      child: Container(
          margin: EdgeInsets.only(bottom: Settings.miniplayerDocked? 68 : 0),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: createSettingsScreen(c, SettingsScreen.page.settings),
          )
      ),
      onWillPop: () async {
        if (SettingsScreen.page.parent == null)
          return true;
        HomeScreen.setState((){
          SettingsScreen.page = SettingsScreen.page.parent;
        });
        return false;
      },
    );
  }

}






