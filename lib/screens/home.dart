import 'package:flutter/material.dart';

import 'package:simple_pod/Theme.dart';
import 'package:simple_pod/screens/home/Playlists.dart';
import 'package:simple_pod/screens/home/Queue.dart';
import 'package:simple_pod/screens/home/Settings.dart';
import 'package:simple_pod/widgets/miniplayer.dart';
import 'package:simple_pod/screens/home/Podcasts.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();

  static setState(Function fn) => _HomeScreenState.state.setState(fn);

  static bool miniplayerDocked = false;

}
class _HomeScreenState extends State<HomeScreen> {

  static State state;

  PageController pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );
  int page = 1;

  @override
  void initState() {
    super.initState();
    state = this;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppTheme.raised,
          selectedItemColor: AppTheme.primary,
          unselectedItemColor: AppTheme.tertiary,
          onTap: changePage,
          currentIndex: page,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.equalizer),
                title: Text("Queue")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted),
                title: Text("Podcasts")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.layers),
                title: Text("Playlists")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text("Settings")
            ),
          ]
      ),
      appBar: page == 0 ? QueueScreen.appbar()
            : page == 1 ? PodcastsScreen.appbar()
            : page == 2 ? PlaylistScreen.appbar()
            : SettingsScreen.appbar(),
      body: Stack(
        children: <Widget>[
          PageView(
            children: <Widget>[
              QueueScreen(),
              PodcastsScreen(),
              PlaylistScreen(),
              SettingsScreen(),
            ],
            controller: pageController,
            onPageChanged: updateNavBar,
          ),
          Positioned(
            bottom: 0,
            child: MiniPlayer(),
          ),
        ],
      ),
    );

  }

  void updateNavBar(int p) {
    setState(() {
      page = p;
    });
  }

  void changePage(int p) {
    setState(() {
      pageController.animateToPage(p,
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    });
  }



}