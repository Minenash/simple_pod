import 'package:flutter/material.dart';
import 'package:simple_pod/widgets/eText.dart';

/*
* class SwitchCategorySetting extends StatefulWidget {

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
}*/