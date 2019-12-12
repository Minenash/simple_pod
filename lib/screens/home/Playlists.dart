import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simple_pod/widgets/eText.dart';

class PlaylistScreen extends StatefulWidget {
  PlaylistScreen({Key key}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();

  static Widget appbar() {
    return AppBar(
      title: Text("Playlists"),
      leading: IconButton(
        icon: Icon(Icons.sort),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(MdiIcons.layersPlus),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(MdiIcons.layersRemove),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(MdiIcons.fileImport),
          onPressed: () {},
        ),
      ],
    );
  }

}

class _PlaylistScreenState extends State<PlaylistScreen> {

  double width = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: eText("Coming\nSoon", wrap: 2, align: TextAlign.center, size: 24, color: Colors.grey[200]),
      ),
    );
  }

}