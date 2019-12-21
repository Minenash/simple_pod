import 'package:flutter/material.dart';
import 'package:simple_pod/Settings.dart';
import 'package:simple_pod/screens/home.dart';

export 'Subcategory.dart';
export 'CategorySetting.dart';
export 'SwitchSetting.dart';
export 'SwitchCategorySetting.dart';
export 'SelectedSetting.dart';
export 'ColorSetting.dart';

Widget createSettingsScreen(BuildContext context, List<SettingWidget> settings, {bool isSub = false}) {
  return Column(
    children: <Widget>[
      for (int i = 0; i < settings.length; i++)
        settings[i].build(),
      if (!Settings.miniplayerDocked && !isSub) SizedBox(height: 90)
    ],
  );
}

abstract class SettingWidget {

  Widget build();

}