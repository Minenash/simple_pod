import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:simple_pod/data_structures/data_structures.dart';
import 'package:simple_pod/screens/home.dart';
import 'package:simple_pod/Theme.dart';
import 'package:simple_pod/widgets/ArtworkImage.dart';
import 'package:simple_pod/widgets/SeekBar.dart';
import 'package:simple_pod/widgets/eText.dart';
import 'package:simple_pod/Playing.dart';


class PlayerScreen extends StatefulWidget {
  PlayerScreen({Key key}) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {

  GlobalKey<ScaffoldState> _scaffold = GlobalKey();
  PageController _controller = PageController(initialPage: 1);

  int page = 1;
  double width = 0;

  PodcastFeed podcast;
  PodcastEpisode episode;
  Widget episodeDescription = Container();

  @override
  initState() {
    super.initState();

    http.Client().get("https://www.relay.fm/focused/feed").then((
        http.Response responce) {
      podcast = PodcastFeed.parse(responce.body);
      episode = podcast.episodes[48];

      episodeDescription = Html(
        data: episode.showNotes,
        customTextStyle: (node, style) => htmlStyle(node, style),
        linkStyle: TextStyle(decoration: TextDecoration.none, color: Colors.orange),
      );

      setState(() {});
    });
  }


  TextStyle htmlStyle(node, base) {
    if (node is dom.Element)
      switch (node.localName) {
        case 'p':  return base.merge(TextStyle(color: Colors.grey[300]));
        case 'li':  return base.merge(TextStyle(color: Colors.grey[300]));
        case 'h4': return base.merge(TextStyle(fontWeight: FontWeight.w300));
        case 'h5': return base.merge(TextStyle(fontSize: 15));
      }
    return base;
  }



  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;

    return SimpleGestureDetector(
      onVerticalSwipe: (direction) {
        if (direction == SwipeDirection.down)
          Navigator.pop(context);
      },
      child: Scaffold(
        key: _scaffold,
        appBar: appbar(),
        backgroundColor: AppTheme.raised,
        drawer: Drawer(),
        endDrawer: endDrawer(),
        persistentFooterButtons: [ mediaControls() ],
        body: Container(
          color: AppTheme.background,
          child: PageView(
            onPageChanged: (p) {setState(() {page = p;});},
            controller: _controller,
            children: <Widget>[
              LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: <Widget>[
                      Container(
                        color: AppTheme.raised,
                        child: chapterEntry("Start", "Chapter Name", "Duration", null, false, header: true),
                      ),
                      Container(
                        height: constraints.maxHeight - 40,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              chapterEntry("00:00", "Free Agents 39", "1 min", null, false),
                              chapterDivider(),
                              chapterEntry("01:00", "David's vacation", "4 min", null, false),
                              chapterDivider(),
                              chapterEntry("05:06", "Jason's low-power week", "6min", null, false),
                              chapterDivider(),
                              chapterEntry("11:36", "Resolution ROFL", "2 min", null, false),
                              chapterDivider(),
                              chapterEntry("14:16", "Thy Game is Over", "2 min", null, false),
                              chapterDivider(),
                              chapterEntry("16:44", "Sponsor: Squarespace", "1 min", "https://google.com", false),
                              chapterDivider(),
                              chapterEntry("18:16", "Hyper-scheduling", "8 min", null, false),
                              chapterDivider(),
                              chapterEntry("26:40", "Notes from the garage", "13 min", null, false),
                              chapterDivider(),
                              chapterEntry("40:27", "Sponser: Freshbooks", "2 min", "https://google.com", false),
                              chapterDivider(),
                              chapterEntry("42:28", "Twelve-Week Year check-in", "4 min", null, false),
                              chapterDivider(),
                              chapterEntry("46:34", "Handing off work", "5 min", null, false),
                              chapterDivider(),
                              chapterEntry("52:25", "Listener Letters", "9 min", null, false),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 32),

                  Container(
                    width: width - 75,
                    height: width - 75,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 5),
                        borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ArtworkImage(podcast?.artwork, width - 75),
                    ),
                  ),
                  SizedBox(height: 52),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      innerControl(MdiIcons.speedometerMedium, () {}),
                      SizedBox(width: 8),
                      innerControl(Icons.star_border, () {}),
                      SizedBox(width: 8),
                      innerControl(Icons.alarm, () {})
                    ],
                  ),
                ],
              ),

              SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                child: episodeDescription,
              ),
            ],
          ),
        )
      ),
    );
  }



  Widget appbar() {

    String title = page == 0? "Chapters"
                 : page == 1? "Player"
                 : page == 2? "Show Notes"
                 : "???";

    return AppBar(
      backgroundColor: AppTheme.raised,
      title: Text(title),
      leading: IconButton(
        icon: Icon(Icons.format_list_bulleted),
          onPressed: () => _scaffold.currentState.openDrawer()
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(MdiIcons.share),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () => _scaffold.currentState.openEndDrawer(),
        )
      ],

    );
  }

  Widget mediaControls() {
    return Container(
      height: 175,
      width: width - 16,
      child: Stack(
        overflow: Overflow.clip,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            bottom: -8,
            left: 0,
            right: 0,
            child: Column(
              children: <Widget>[
                DotsIndicator(dotsCount: 3, position: page.toDouble(), decorator: DotsDecorator(
                  activeColor: Colors.white,
                  color: Colors.grey[500]
                )),
                SizedBox(height: 4),
                eText(Playing.episodeName, size: 18),
                SizedBox(height: 4),
                eText(Playing.podcastName + "   •   " + Playing.episodeRelease, color: Colors.grey[300]),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    eText("01:20", color: AppTheme.tertiary),
                    Container(
                      width: width - 142,
                      child: eText(Playing.chapterName,
                        align: TextAlign.center,
                        italic: true,
                        color: AppTheme.tertiary
                      ),
                    ),
                    eText("-05:10", color: AppTheme.tertiary),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    control(Icons.skip_previous, () {}),
                    control(Icons.fast_rewind, () {}),
                    control(Icons.play_arrow, () {}),
                    control(Icons.fast_forward, () {}),
                    control(Icons.skip_next, () {}),
                  ],
                ),

              ],
            )
          ),
          Positioned(
            bottom: 64,
            child: Row(
              children: <Widget>[
                eText("  00:32:05", color: Colors.grey[300]),
                SeekableProgressBar(width: width - 142, progress: 0.5),
                eText("-00:25:21  ", color: Colors.grey[300]),
              ],
            ),
          ),
        ],
      )
    );
  }


  Widget endDrawer() {
    return Drawer(

    );
  }

  Widget control(IconData icon, Function onPressed) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 42,
      color: Colors.white,
      onPressed: onPressed,
    );
  }
  Widget innerControl(IconData icon, Function onPressed) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 24,
      color: Colors.white,
      onPressed: onPressed,
    );
  }

  _launchURL(BuildContext context, String url) async {
    if (await canLaunch(url))
      await launch(url);
    else
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Unable to Open Link")));
  }

  Widget chapterEntry(String start, String title, String duration, String link, bool img, {bool header = false}) {

    if (link != null && link != "")
      return InkWell(
        onTap: () => _launchURL(context, link),
        child: chapterEntry(start, title, duration, "", img),
      );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: header ? 12 : 24),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            eText(start),
            SizedBox(width: 16),
            Expanded(
              child: eText(title, wrap: 2),
            ),
            if (link == "") Icon(Icons.open_in_browser),
            if (img) Icon(Icons.image),
            SizedBox(width: 16),
            eText(duration, weight: FontWeight.bold),
          ]
      ),
    );
  }

  Widget chapterDivider() => Container(
    height: 1,
    width: width - 20,
    color: Colors.white,
  );
  
}