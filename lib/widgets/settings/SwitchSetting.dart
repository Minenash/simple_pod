import 'package:flutter/material.dart';
import 'package:simple_pod/AppTheme.dart';
import 'package:simple_pod/widgets/eText.dart';
import 'package:simple_pod/widgets/settings/all.dart';

class SwitchSetting implements SettingWidget{

  final IconData icon;
  final String title;
  final String subtitle;
  final String subtitle_on;
  final Function() getValue;
  final Function(bool) onChange;

  SwitchSetting({ this.icon, this.title, this.subtitle, this.subtitle_on,
    this.getValue, this.onChange});

  @override
  Widget build() => SwitchSettingWidget(icon: icon, title: title,
      subtitle: subtitle, subtitle_on: subtitle_on, getValue: getValue, onChange: onChange);
}

class SwitchSettingWidget extends StatefulWidget{

  final IconData icon;
  final String title;
  final String subtitle;
  final String subtitle_on;
  final Function() getValue;
  final Function(bool) onChange;

  SwitchSettingWidget({ this.icon, this.title, this.subtitle, this.subtitle_on,
    this.getValue, this.onChange});

  @override
  _SwitchSettingWidgetState createState() => _SwitchSettingWidgetState(icon: icon, title: title,
      subtitle: subtitle, subtitle_on: subtitle_on, getValue: getValue, onChange: onChange);
}

class _SwitchSettingWidgetState extends State<SwitchSettingWidget> {

  final IconData icon;
  final String title;
  final String subtitle;
  final String subtitle_on;
  final Function(bool) onChange;

  bool currentValue = false;

  _SwitchSettingWidgetState({ this.icon, this.title, this.subtitle, this.subtitle_on,
    Function getValue, this.onChange}) {
    currentValue = getValue();
  }

  @override
  Widget build(BuildContext context) {

    bool hasSubtitle = subtitle != null;

    return InkWell(
      child: Container(
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
                    child: eText(currentValue ? subtitle_on ?? subtitle : subtitle, color: AppTheme.secondary, wrap: 2)
                ),
              ],
            ),
            Spacer(),
            SizedBox(width: 16),
            Switch(
              value: currentValue,
              onChanged: (_) => flipSwitch(),
              activeColor: AppTheme.switchOn,
              inactiveTrackColor: AppTheme.switchOffTrack,
              inactiveThumbColor: AppTheme.switchOffThumb,
            )
          ],
        ),
      ),
      onTap: flipSwitch,
    );
  }

  flipSwitch() => setState(() {
    currentValue = !currentValue;
    if (onChange !=null) onChange(currentValue);
  });
}