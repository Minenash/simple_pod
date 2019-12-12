import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simple_pod/Theme.dart';
import 'package:simple_pod/screens/home.dart';
import 'package:simple_pod/widgets/ArtworkImage.dart';
import 'package:simple_pod/widgets/eText.dart';

class PodcastsScreen extends StatefulWidget {
  PodcastsScreen({Key key}) : super(key: key);

  @override
  _PodcastsScreenState createState() => _PodcastsScreenState();

  static Widget appbar() {
    return AppBar(
      title: Text("Podcast"),
      leading: IconButton(
        icon: Icon(Icons.sort),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.sync),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.add_circle_outline),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }

}

class _PodcastsScreenState extends State<PodcastsScreen> {

  double width = 0;

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        return Container(
          margin: EdgeInsets.only(top: 2, bottom: HomeScreen.miniplayerDocked? 68 : 0),
          width: width,
          height: height,
          child: ListView(
            children: <Widget>[
              podcastEntry("Focused", "9d", 87, 14, 47, 2, 40, "https://relayfm.s3.amazonaws.com/uploads/broadcast/image_2x/34/focused_artwork.png"),
              podcastEntry("Cortex", "6d", 93, 93, 93, 0, 0, "https://relayfm.s3.amazonaws.com/uploads/broadcast/image_2x/17/cortex_artwork.png"),
              podcastEntry("Hello Internet", "13d", 101, 101, 101, 0, 0, "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Hello_Internet_Logo.svg/800px-Hello_Internet_Logo.svg.png"),
              podcastEntry("Thoroughly Considered", "1m", 55, 0, 55, 0, 0, "https://relayfm.s3.amazonaws.com/uploads/broadcast/image_2x/22/tc_artwork.png"),
              podcastEntry("The British History Podcast", "6d", 347, 0, 15, 0, 332, "https://is2-ssl.mzstatic.com/image/thumb/Podcasts123/v4/ee/46/ce/ee46ce03-497c-a784-ee75-7173b5e2c601/mza_15550679075073229118.jpg/268x0w.jpg"),
              if (HomeScreen.miniplayerDocked) SizedBox(height: 90)
            ],
          ),
        );
      },
    );
  }

  Widget chapterDivider() => Container(
    margin: const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 80),
    height: 1,
    width: width,
    color: AppTheme.secondary,
  );

  Widget podcastEntry(String podcast, String last, int episodes, int download, int listened, int ignored, int  unlistened, String img) {

    bool unlist99 = unlistened > 99;

    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 6, left: 6, right: 6),
      child: Row(
        children: <Widget>[

          ArtworkImage(img, 60),
          SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(4),
                color: AppTheme.raised,
                width: width - 76,
                height: 25,
                child: Row(
                  children: <Widget>[
                    eText(podcast, color: AppTheme.secondary, weight: FontWeight.w500),
                    Spacer(),
                    eText(last, color: AppTheme.secondary)
                  ],
                ),
              ),
              Container(
                width: width - 76,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 4, top: 0),
                          child: eText("$episodes episodes", color: AppTheme.secondary, size: 14),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 4, top: 2),
                          child: Row(
                            children: <Widget>[
                              if (download != 0) iconNumPair(Icons.file_download, download),
                              if (download != 0) SizedBox(width: 12),
                              if (listened != 0) iconNumPair(Icons.check, listened),
                              if (listened != 0) SizedBox(width: 12),
                              if ( ignored != 0) iconNumPair(MdiIcons.cancel, ignored),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (unlistened != 0) Container(
                      height: 35,
                      width: 35,
                      child: Stack(
                        children: <Widget>[
                          CustomPaint(
                              size: Size(35, 35),
                              painter: DrawTriangle()
                          ),
                          Positioned(
                            right: unlist99? 3 : 2.5,
                            top:   unlist99? 0 : 2.5,
                            child: unlist99?
                                     eText("+", size: 18, weight: FontWeight.w600,)
                                   : eText("$unlistened", size: 13, weight: FontWeight.w600,)
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }


  Widget iconNumPair(IconData icon, int num) {
    return Row(
      children: <Widget>[
        Icon(icon, size: 14),
        SizedBox(width: 4),
        eText("$num", color: AppTheme.secondary)
      ],
    );
  }

}



class DrawTriangle extends CustomPainter {

  Paint _paint;

  DrawTriangle() {
    _paint = Paint()
      ..color = AppTheme.unreadBadge
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

