import 'package:flutter/material.dart';
import 'package:simple_pod/AppTheme.dart';
import 'package:simple_pod/widgets/eText.dart';
import 'package:simple_pod/widgets/settings/all.dart';

class CategorySetting implements SettingWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final Function onTap;

  CategorySetting({this.icon, this.title, this.subtitle, this.onTap});

  @override
  Widget build() => CategorySettingWidget(icon: icon, title: title, subtitle: subtitle, onTap: onTap);
}

class CategorySettingWidget extends StatelessWidget{

  final IconData icon;
  final String title;
  final String subtitle;
  final Function onTap;

  CategorySettingWidget({this.icon, this.title, this.subtitle, this.onTap});

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
                    child: eText(subtitle, color: AppTheme.secondary, wrap: 2)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}