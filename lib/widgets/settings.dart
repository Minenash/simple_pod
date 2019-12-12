import 'package:flutter/material.dart';
import 'package:simple_pod/screens/home.dart';
import 'package:simple_pod/widgets/eText.dart';

Widget createSettingsScreen(BuildContext context, List settings, {bool isSub = false}) {
  return Column(
    children: <Widget>[
      for (int i = 0; i < settings.length; i++)
        settings[i],
      if (!HomeScreen.miniplayerDocked && !isSub) SizedBox(height: 90)
    ],
  );
}

class Subcategory extends StatelessWidget {

  final String title;
  final List<Widget> settings;

  Subcategory({this.title, this.settings});

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

class CategorySetting extends StatelessWidget{

  final IconData icon;
  final String title;
  final String subtitle;
  final Function onTap;

  CategorySetting({ this.icon, this.title, this.subtitle, this.onTap});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(icon),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                eText(title, size: 16),
                Container(
                    width: MediaQuery.of(context).size.width - 72,
                    child: eText(subtitle, color: Colors.grey[400], wrap: 2)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SwitchSetting extends StatefulWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final String subtitle_on;
  final Function(bool) onChange;


  SwitchSetting({ this.icon, this.title, this.subtitle, this.subtitle_on, this.onChange});

  @override
  _SwitchSettingState createState() => _SwitchSettingState(icon: icon, title: title,
      subtitle: subtitle, subtitle_on: subtitle_on, onChange: onChange);
}

class _SwitchSettingState extends State<SwitchSetting> {

  final IconData icon;
  final String title;
  final String subtitle;
  final String subtitle_on;
  final Function(bool) onChange;

  bool currentValue = false;
  bool getValue() => currentValue;

  _SwitchSettingState({ this.icon, this.title, this.subtitle, this.subtitle_on, this.onChange});

  @override
  Widget build(BuildContext context) {

    bool hasSubtitle = subtitle != null;

    return Container(
      margin: EdgeInsets.only(top: hasSubtitle ? 16 : 8, bottom: hasSubtitle? 16 : 8, left: 16, right: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              eText(title, size: 16),
              if (hasSubtitle) Container(
                  width: MediaQuery.of(context).size.width - 147,
                  child: eText(currentValue ? subtitle_on ?? subtitle : subtitle, color: Colors.grey[400], wrap: 2)
              ),
            ],
          ),
          Spacer(),
          SizedBox(width: 16),
          Switch(
            value: currentValue,
            onChanged: (v) {setState(() {
              currentValue = v;
              if (onChange !=null) onChange(v);
            });},
            activeColor: Colors.white,
            inactiveTrackColor: Colors.grey[800],
            inactiveThumbColor: Colors.grey[700],
          )
        ],
      ),
    );
  }
}

class SwitchCategorySetting extends StatefulWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final Function onTap;
  final Function(bool) onChange;

  SwitchCategorySetting({ this.icon, this.title, this.subtitle, this.onTap, this.onChange});

  @override
  _SwitchCategorySettingState createState() => _SwitchCategorySettingState(icon: icon, title: title,
      subtitle: subtitle, onChange: onChange);
}

class _SwitchCategorySettingState extends State<SwitchCategorySetting> {

  final IconData icon;
  final String title;
  final String subtitle;
  final Function onTap;
  final Function(bool) onChange;

  bool currentValue = false;
  bool getValue() => currentValue;

  _SwitchCategorySettingState({ this.icon, this.title, this.subtitle, this.onTap, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: onTap ?? () {},
          child: Container(
            width: MediaQuery.of(context).size.width - 68,
            padding: const EdgeInsets.only(
                top: 16, bottom: 16, left: 16, right: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(icon),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    eText(title, size: 16),
                    Container(
                        width: MediaQuery.of(context).size.width - 177,
                        child: eText(subtitle, color: Colors.grey[400], wrap: 2)
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_horiz, size: 20),
              ],
            ),
          ),
        ),
        Container(
          height: 32,
          width: 1,
          color: Colors.grey[400],
        ),
        Switch(
          value: currentValue,
          onChanged: (v) {
            setState(() {
              currentValue = v;
              if (onChange != null) onChange(v);
            });
          },
          activeColor: Colors.white,
          inactiveTrackColor: Colors.grey[800],
          inactiveThumbColor: Colors.grey[700],
        ),
      ],
    );
  }
}

class SelectedSetting extends StatefulWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final String selected;
  final Function(bool) onChange;


  SelectedSetting({ this.icon, this.title, this.subtitle, this.selected, this.onChange});

  @override
  _SelectedSettingState createState() => _SelectedSettingState(icon: icon, title: title,
      subtitle: subtitle, selected: selected, onTap: onChange);
}

class _SelectedSettingState extends State<SelectedSetting> {

  final IconData icon;
  final String title;
  final String subtitle;
  final String selected;
  final Function onTap;

  _SelectedSettingState({ this.icon, this.title, this.subtitle, this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        margin: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(icon),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                eText(title, size: 16),
                Container(
                    width: MediaQuery.of(context).size.width - 150,
                    child: eText(subtitle, color: Colors.grey[400], wrap: 2)
                ),
              ],
            ),
            Spacer(),
            Container(
              height: 32,
              width: 1,
              color: Colors.grey[400],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 12),
              child: eText(selected, bold: true),
            )
          ],
        ),
      ),
    );
  }
}

class ColorSetting extends StatefulWidget {

  final IconData icon;
  final String title;
  final Function(Color) onChange;


  ColorSetting({ this.icon, this.title, this.onChange});

  @override
  _ColorSettingState createState() => _ColorSettingState(icon: icon, title: title, onChange: onChange);
}

class _ColorSettingState extends State<ColorSetting> {

  final IconData icon;
  final String title;
  final Function(Color) onChange;

  Color currentValue = Colors.white;
  Color getValue() => currentValue;

  _ColorSettingState({ this.icon, this.title, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 16),
          eText(title, size: 16),
          Spacer(),
          SizedBox(width: 16),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: currentValue,
              borderRadius: BorderRadius.circular(45)
            ),
          )
        ],
      ),
    );
  }
}
