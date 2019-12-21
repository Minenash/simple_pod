import 'package:flutter/material.dart';
import 'package:simple_pod/widgets/eText.dart';
import 'package:simple_pod/widgets/settings/all.dart';

class Subcategory implements SettingWidget {

  final String title;
  final List<SettingWidget> settings;

  Subcategory({this.title, this.settings});

  @override
  Widget build() {
    return SubcategoryWidget(title: title, settings: settings);
  }
}

class SubcategoryWidget extends StatelessWidget{

  final String title;
  final List<SettingWidget> settings;

  SubcategoryWidget({this.title, this.settings});

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(top: 16, left: 16),
            child: eText(title, bold: true, )
        ),
        createSettingsScreen(context, settings, isSub: true)
      ],
    );
  }
}