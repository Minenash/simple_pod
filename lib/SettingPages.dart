import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simple_pod/AppTheme.dart';
import 'package:simple_pod/main.dart';
import 'package:simple_pod/screens/home.dart';
import 'package:simple_pod/screens/home/Settings.dart';
import 'package:simple_pod/widgets/settings/all.dart';
import 'package:simple_pod/Settings.dart';

class SettingsPage {
  final String title;
  final Widget leading;
  final List<Widget> actions;
  final List<SettingWidget> settings;
  final SettingsPage parent;

  SettingsPage({this.title, this.leading, this.parent, this.actions, this.settings});
}

class SettingPages {

  static _setState(Function fn) => HomeScreen.setState(fn);

  static _setPage(SettingsPage page) =>
   Future.delayed(const Duration(milliseconds: 100), () {
     _setState(() => SettingsScreen.page = page);
   });

  static _backTo(SettingsPage page) =>
    IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => _setPage(page),
    );

  /*
  * Main Setting Screen
  */
  static SettingsPage main = SettingsPage(
    title: "Settings",
    leading: IconButton(
      icon: Icon(Icons.account_circle),
      onPressed: () {},
    ),
    parent: null,
    actions: [],
    settings: [
      CategorySetting(
        icon: MdiIcons.imageOutline,
        title: "Display",
        subtitle: "Configure The Layout and Style of The App",
        onTap: () => _setPage(display),
      ),
    ]
  );

 static SettingsPage display = SettingsPage(
     title: "Display",
     leading: _backTo(main),
     parent: SettingPages.main,
     actions: [],
     settings: [
       SwitchSetting(
         icon: MdiIcons.dockBottom,
         title: "Dock MiniPlayer",
         subtitle: "MiniPlayer is Floating",
         subtitle_on: "MiniPlayer is Docked",
         getValue: () => Settings.miniplayerDocked,
         onChange: (docked) => HomeScreen.setState(() => Settings.miniplayerDocked = docked),
       ),
       Subcategory(
         title: "Theme",
         settings: [
           SelectedSetting(
             icon: MdiIcons.themeLightDark,
             title: "Theme",
             subtitle: "Light, Grey, Dark, or Black (AMOLED)",
             getSelected: () => AppTheme.name,
             options: ["Light", "Grey", "Dark", "Black"],
             onChange: (theme) {
               Main.setState((){
                 if (theme == "Light") AppTheme = AppThemeProperties.light;
                 if (theme == "Grey") AppTheme = AppThemeProperties.grey;
                 if (theme == "Dark") AppTheme = AppThemeProperties.dark;
                 if (theme == "Black") AppTheme = AppThemeProperties.black;
               });
               _setState((){});
             },
           ),
           ColorSetting(
             icon: MdiIcons.water,
             title: "Unlistened Badge Color",
             subtitle: "Change the color of the unlistened badge",
             getValue: () => Settings.badgeColor,
             getDefaultValue: () => AppTheme.unreadBadge,
             onChange: (color) => _setState(() => Settings.badgeColor = color),
           ),
           ColorSetting(
             icon: MdiIcons.water,
             title: "Show Note's Link Color",
             subtitle: "Change the color of the shownote's links",
             getValue: () => Settings.linkColor,
             getDefaultValue: () => AppTheme.link,
             onChange: (color) => _setState(() => Settings.linkColor = color),
           ),
         ],
       ),

     ]
 );

}