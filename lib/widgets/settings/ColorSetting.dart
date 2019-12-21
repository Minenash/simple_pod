import 'package:flutter/material.dart';
import 'package:simple_pod/AppTheme.dart';
import 'package:simple_pod/widgets/eText.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:simple_pod/widgets/settings/all.dart';

class ColorSetting implements SettingWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Function getDefaultValue;
  final Function getValue;
  final Function(Color) onChange;

  ColorSetting({ this.icon, this.title, this.subtitle, this.getValue, this.getDefaultValue, this.onChange});

  @override
  Widget build() => ColorSettingWidget(icon: icon, title: title, subtitle: subtitle,
      getValue: getValue, getDefaultValue: getDefaultValue, onChange: onChange);
}

class ColorSettingWidget extends StatefulWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final Function getDefaultValue;
  final Function getValue;
  final Function(Color) onChange;

  ColorSettingWidget({ this.icon, this.title, this.subtitle, this.getValue, this.getDefaultValue, this.onChange});

  @override
  _ColorSettingWidgetState createState() => _ColorSettingWidgetState(
      icon: icon, title: title, subtitle: subtitle, getValue: getValue, getDefaultValue: getDefaultValue, onChange: onChange);
}

class _ColorSettingWidgetState extends State<ColorSettingWidget> {

  final IconData icon;
  final String title;
  final String subtitle;
  final Function(Color) onChange;
  final Function getDefaultValue;

  Color currentValue;
  Color tempValue;

  _ColorSettingWidgetState({ this.icon, this.title, this.subtitle,
    Function getValue, this.getDefaultValue, this.onChange}) {
    currentValue = getValue();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(icon),
              SizedBox(width: 16),
              subtitle == null ? eText(title, size: 16) : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  eText(title, size: 16),
                  Container(
                      width: MediaQuery.of(context).size.width - 150,
                      child: eText(subtitle, color: AppTheme.secondary, wrap: 2)
                  ),
                ],
              ),
              Spacer(),
              SizedBox(width: 16),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    color: currentValue ?? getDefaultValue(),
                    borderRadius: BorderRadius.circular(45)
                ),
              )
            ],
          ),
        ),
        onTap: () {
          tempValue = currentValue ?? getDefaultValue();
          showDialog(context: context, builder: (context) =>
              AlertDialog(
                backgroundColor: AppTheme.background,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppTheme.name != "Black" ? AppTheme.background : AppTheme.primary),
                  borderRadius: BorderRadius.circular(15)
                ),
                title: eText(title, color: AppTheme.primary),
                content: Container(
                  height: 200,
                  child: MaterialColorPicker(
                    onColorChange: (color) {tempValue = color;},
                    selectedColor: tempValue,
                  ),
                ),
                actions: <Widget>[
                  MaterialButton(
                    child: eText("CANCEL", color: AppTheme.primary),
                    onPressed: () => Navigator.pop(context),
                  ),
                  MaterialButton(
                    child: eText("THEME DEFAULT", color: AppTheme.primary),
                    onPressed: () {
                      setState(() {
                        currentValue = null;
                      });
                      Navigator.pop(context);
                      if (onChange != null) onChange(null);
                    },
                  ),
                  MaterialButton(
                    child: eText("SUBMIT", color: AppTheme.primary),
                    onPressed: () {
                      setState(() {
                        currentValue = tempValue;
                      });
                      Navigator.pop(context);
                      if (onChange != null) onChange(tempValue);
                    },
                  )
                ],
              )
          );}
    );
  }
}
