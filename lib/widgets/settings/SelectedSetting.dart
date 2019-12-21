import 'package:flutter/material.dart';
import 'package:simple_pod/AppTheme.dart';
import 'package:simple_pod/widgets/eText.dart';
import 'package:simple_pod/widgets/settings/all.dart';

class SelectedSetting implements SettingWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Function getSelected;
  final List<String> options;
  final Function(String) onChange;

  SelectedSetting({this.icon, this.title, this.subtitle, this.getSelected, this.options, this.onChange});

  @override
  Widget build() => SelectedSettingWidget(icon: icon, title: title, subtitle: subtitle,
    getSelected: getSelected, options: options, onChange: onChange);
}

class SelectedSettingWidget extends StatefulWidget{

  final IconData icon;
  final String title;
  final String subtitle;
  final Function getSelected;
  final List<String> options;
  final Function(String) onChange;

  SelectedSettingWidget({this.icon, this.title, this.subtitle, this.getSelected, this.options, this.onChange});

  @override
  _SelectedSettingWidgetState createState() => _SelectedSettingWidgetState(icon: icon, title: title,
      subtitle: subtitle, getSelected: getSelected, options: options, onChange: onChange);
}

class _SelectedSettingWidgetState extends State<SelectedSettingWidget> {

  final IconData icon;
  final String title;
  final String subtitle;
  final List<String> options;
  final Function(String) onChange;

  String selected;
  List<bool> selectedList;

  String tempSelected;

  _SelectedSettingWidgetState({ this.icon, this.title, this.subtitle, this.options,
    Function getSelected, this.onChange}) {
    selectedList = List.generate(options.length, (_) => false);
    selected = getSelected();
  }

  bool showPicker = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      firstChild: buildMain(),
      secondChild: buildPicker(),
      crossFadeState: showPicker
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
    );

  }

  Widget buildMain() {
    return InkWell(
      onTap: () => setState(() {
        showPicker = true;
        tempSelected = selected;
        selectedList = [
          for (String option in options)
            option == selected
        ];
      }),
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
                    child: eText(subtitle, color: AppTheme.secondary, wrap: 2)
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

  Widget buildPicker() {
    return Container(
        margin: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Container(
                height: 50,
                width: 75,
                child: Center(child: eText("CANCEL")),
              ),
              borderRadius: BorderRadius.circular(15),
              onTap: () => setState(() => showPicker = false),
            ),
            SizedBox(width: 8),
            ToggleButtons(
              children: <Widget>[
                for (int i = 0; i < options.length; i++)
                  eText(options[i], color: selectedList[i] ? AppTheme.raised : AppTheme.primary),
              ],
              isSelected: selectedList,
              borderColor: AppTheme.primary,
              borderRadius: BorderRadius.circular(15),
              selectedBorderColor: AppTheme.primary,
              fillColor: AppTheme.primary,
              selectedColor: AppTheme.primary,
              splashColor: AppTheme.tertiary,
              onPressed: (i) {
                setState(() {
                  selectedList = [false, false, false, false];
                  selectedList[i] = true;
                  tempSelected = options[i];
                });
              },

            ),
            SizedBox(width: 8),
            InkWell(
              child: Container(
                height: 50,
                width: 75,
                child: Center(child: eText("SUBMIT")),
              ),
              borderRadius: BorderRadius.circular(15),
              onTap: () => setState(() {
                showPicker = false;
                selected = tempSelected;
                onChange(selected);
                print(selected);
              }),
            ),
          ],
        )
    );
  }
}