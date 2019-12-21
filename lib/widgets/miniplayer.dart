import 'package:flutter/material.dart';

import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:simple_pod/Settings.dart';

import 'package:simple_pod/AppTheme.dart';
import 'ArtworkImage.dart';
import 'eText.dart';
import 'package:simple_pod/Playing.dart';
import 'package:simple_pod/screens/home.dart';

class MiniPlayer extends StatefulWidget {

  @override
  _MiniPlayerState createState() => _MiniPlayerState();

}

class _MiniPlayerState extends State<MiniPlayer> {

  double width = 0;

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;

    if (!Settings.miniplayerDocked) {
      return miniPlayer();
    }
    else {
      return Column(
        children: <Widget>[
          miniPlayer(),
          Container(
            color: AppTheme.raised,
            width: width,
            height: 8,
          ),
        ],
      );
    }
  }

  Widget miniPlayer() {

    bool docked = Settings.miniplayerDocked;

    return Container(
      margin: EdgeInsets.all(docked ? 0 : 8 ),
      height: 60,
      width: width - (docked ? 0 : 16),
      decoration: BoxDecoration(
        color: AppTheme.raised,
        borderRadius: BorderRadius.circular( docked ? 0: 8 ),
      ),
      child: SimpleGestureDetector(
        onTap: () => Navigator.pushNamed(context, '/player'),
        onVerticalSwipe: (direction) {
          if (direction == SwipeDirection.up) Navigator.pushNamed(context, '/player');
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular( docked ? 0 : 8 ),
          child: Row(
            children: <Widget>[
              ArtworkImage(Playing.img, 60),
              SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  eText(Playing.episodeName),
                  SizedBox(height: 8),
                  eText(Playing.podcastName + "   •   " + Playing.episodeRelease
                      + (Playing.chapterName == null? "" : "   |   ${Playing.chapterName}"), color: AppTheme.tertiary, size: 12),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.pause),
                iconSize: 38,
                onPressed: () => setState(() => Settings.miniplayerDocked = !docked),
              ),
              SizedBox(width: docked? 4 : 8),
            ],
          ),
        ),
      ),
    );
  }
}