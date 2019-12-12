import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simple_pod/screens/home/Settings.dart';
import 'package:simple_pod/screens/home.dart';
import 'package:simple_pod/widgets/settings.dart';

class SettingsPage {
  final String title;
  final Widget leading;
  final List<Widget> actions;
  final List<Widget> settings;

  SettingsPage({this.title, this.leading, this.actions, this.settings});
}

class Settings {

  /*
   * Main Setting Screen
   */

  static _setPage(SettingsPage page) => Future.delayed(const Duration(milliseconds: 100), () {
    HomeScreen.setState((){
      SettingsScreen.page = page;
    });
  });
  
  static _backTo(SettingsPage page) => IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () => _setPage(page),
  );

  static final SettingsPage main = SettingsPage(
    title: "Settings",
    leading: IconButton(
      icon: Icon(Icons.account_circle),
      onPressed: () {},
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.history),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.email),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.info_outline),
        onPressed: () {},
      ),
    ],
    settings: [
      CategorySetting(
        icon: Icons.wifi,
        title: "Network",
        subtitle: "Manage WiFi and 4G/LTE Limitations",
        onTap: () => _setPage(network),
      ),
      CategorySetting(
        icon: MdiIcons.imageOutline,
        title: "Display",
        subtitle: "Configure The Layout and Style of The App",
        onTap: () => _setPage(display),
      ),
      CategorySetting(
        icon: MdiIcons.playBoxOutline,
        title: "Player",
        subtitle: "Change Player Behavior and Controls",
        onTap: () => _setPage(player),
      ),
      CategorySetting(
        icon: Icons.layers,
        title: "Playlists",
        subtitle: "Change Playlists Settings",
        onTap: () => _setPage(playlists),
      ),
      CategorySetting(
        icon: Icons.sync,
        title: "Sync",
        subtitle: "Change When and How Often to Sync",
        onTap: () => _setPage(sync),
      ),
      CategorySetting(
        icon: Icons.widgets,
        title: "Widget",
        subtitle: "Change the Layout and Style of the Widget",
        onTap: () => _setPage(widget),
      ),
      CategorySetting(
        icon: Icons.notifications,
        title: "Notifications",
        subtitle: "Change What and When to Recieve Notifications",
      ),
      CategorySetting(
        icon: MdiIcons.tea,
        title: "Donate",
        subtitle: "If You Like the App, Consider Donating",
      ),
    ]
  );

  /*
   * Network Settings Screen
   */

  static final SettingsPage network = SettingsPage(
    title: "Network",
    leading: _backTo(main),
    actions: [],
    settings: [
      Subcategory(
        title: "Data Restrictions",
        settings: [
          SwitchSetting(
            icon: Icons.file_download,
            title: "Download Episodes",
            subtitle: "WiFi and Data",
            subtitle_on: "Wifi only",
          ),
          SwitchSetting(
            icon: MdiIcons.accessPoint,
            title: "Streaming",
            subtitle: "WiFi and Data",
            subtitle_on: "Wifi only",
          ),
          SwitchSetting(
            icon: Icons.sync,
            title: "Sync",
            subtitle: "WiFi and Data",
            subtitle_on: "Wifi only",
          ),
        ]
      ),
    ]
  );
  
  static final SettingsPage display = SettingsPage(
    title: "Display",
    leading: _backTo(main),
    actions: [],
    settings: [
      Subcategory(
        title: "Miscellaneous",
        settings: [
          SelectedSetting(
            icon: MdiIcons.themeLightDark,
            title: "Theme",
            subtitle: "Light, Grey, Dark, or Black (AMOLED)",
            selected: "Dark",
          ),
          SwitchSetting(
            icon: MdiIcons.dockBottom,
            title: "Dock MiniPlayer",
            subtitle: "MiniPlayer is Floating",
            subtitle_on: "MiniPlayer is Docked",
          ),
        ],
      ),
      Subcategory(
        title: "Podcast",
        settings: [
          SwitchSetting(
            icon: MdiIcons.eye,
            title: "Hide Played Podcasts",
            subtitle: "Showing All Podcasts",
            subtitle_on: "Hiding Podcasts with no New Content",
          ),
          CategorySetting(
            icon: MdiIcons.viewGrid,
            title: "Display Mode",
            subtitle: "List or Grid",
          ),
          SwitchCategorySetting(
            icon: MdiIcons.closeCircleOutline,
            title: "Ignore Articles when Sorting",
            subtitle: "Ignore articles, such as 'A' and 'The'. Customizable",
           ),
        ],
      ),
      Subcategory(
        title: "Episodes",
        settings: [
          SwitchSetting(
            icon: MdiIcons.eye,
            title: "Hide Listened/Ignored Episodes",
            subtitle: "Showing All Episodes",
            subtitle_on: "Hiding Listed/Ignored Episodes",
          ),
          CategorySetting(
            icon: MdiIcons.viewGrid,
            title: "Display Mode",
            subtitle: "List or Grid",
          ),
          SelectedSetting(
            icon: MdiIcons.recordCircle,
            title: "Quick Action",
            subtitle: "Play, Download, or Disabled",
            selected: "Play",
          ),
          SwitchSetting(
            icon: MdiIcons.image,
            title: "Episode Artwork",
            subtitle: "Using Podcast Artwork",
            subtitle_on: "Using Episode Artwork if Avaliable",
          ),
          SwitchSetting(
            icon: MdiIcons.coinOutline,
            title: "Show Podcast Support Button",
            subtitle: "Hiding Podcast Support Button",
            subtitle_on: "Showing Podcast Support Button",
          ),
        ],
      ),
    ]
  );
  static final SettingsPage player = SettingsPage(
    title: "Player",
    leading: _backTo(main),
    actions: [],
    settings: [
      Subcategory(
        title: "Miscellaneous",
        settings: [
          SwitchSetting(
            icon: MdiIcons.cellphonePlay,
            title: "Keep Player Screen On",
            subtitle: "NOT Keeping the Player Screen On",
            subtitle_on: "Keeping the Player Screen On",
          ),
        ],
      ),
      Subcategory(
        title: "Audio Effects",
        settings: [
          SelectedSetting(
            icon: MdiIcons.speedometerMedium,
            title: "Playback Speed (Default)",
            subtitle: "Increase CPU/Battery Ussage",
            selected: "1.0X",
          ),
          SwitchSetting(
            icon: MdiIcons.callMerge,
            title: "Mono Audio",
            subtitle: "L/R Channles NOT Merged",
            subtitle_on: "L/R Channles Merged",
          ),
        ],
      ),
      Subcategory(
        title: "Controls",
        settings: [
          CategorySetting(
            icon: Icons.play_arrow,
            title: "Player Controls",
            subtitle: "Change the Player Controls",
          ),
          CategorySetting(
            icon: Icons.play_arrow,
            title: "Headset / Bluetooth Controls",
            subtitle: "Change Controls for Headsets / Bluetooth Devices",
          ),
        ],
      ),
      Subcategory(
        title: "Sleep Timer",
        settings: [
          SwitchSetting(
            icon: MdiIcons.sleep,
            title: "Always On",
            subtitle: "Not Automatically enable timer when you start listening",
            subtitle_on: "Automatically enable timer when you start listening",
          ),
          SwitchSetting(
            icon: MdiIcons.stopCircleOutline,
            title: "Keep Episode",
            subtitle: "Not Advancing Episodes when \"Stop at the end of Episode\" is on",
            subtitle_on: "Advancing Episodes when \"Stop at the end of Episode\" is on",
          ),
          SwitchSetting(
            icon: Icons.vibration,
            title: "Vibrate when About to Expire",
          ),
          SelectedSetting(
            icon: Icons.vibration,
            title: "Shake to Reset",
            subtitle: "Shaking the device will reset the timer. Force Customisable",
            selected: "Normal",
          ),
        ],
      ),
    ],
  );
  static final SettingsPage playlists = SettingsPage(
    title: "Playlists",
    leading: _backTo(main),
    actions: [],
    settings: [],
  );
  static final SettingsPage sync = SettingsPage(
    title: "Sync",
    leading: _backTo(main),
    actions: [],
    settings: [],
  );
  static final SettingsPage widget = SettingsPage(
    title: "Widget",
    leading: _backTo(main),
    actions: [],
    settings: [
      Subcategory(
        title: "Display",
        settings: [
          ColorSetting(
            icon: MdiIcons.formatColorFill,
            title: "Background Color",
          ),
          ColorSetting(
            icon: MdiIcons.formatColorText,
            title: "Font Color",
          ),
          ColorSetting(
            icon: Icons.play_arrow,
            title: "Button Color",
          ),
        ],
      ),
      Subcategory(
        title: "Controls",
        settings: [
          SwitchSetting(
            icon: Icons.skip_next,
            title: "Next Chapter/Episode"
          ),
          SwitchSetting(
              icon: Icons.skip_previous,
              title: "Previous Chapter/Episode"
          ),
          SwitchSetting(
              icon: Icons.fast_forward,
              title: "Fast Forward"
          ),
          SwitchSetting(
              icon: Icons.fast_rewind,
              title: "Rewind"
          ),
          SwitchSetting(
              icon: Icons.layers,
              title: "Playlist"
          ),
          SwitchSetting(
              icon: Icons.collections_bookmark,
              title: "Chapters"
          ),
        ],
      ),
    ],
  );
  
}

