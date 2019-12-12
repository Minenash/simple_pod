import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArtworkImage extends StatelessWidget {

  String src;
  double size;

  ArtworkImage(this.src, this.size);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: src,
      fadeInDuration: Duration(seconds: 1),
      placeholder: (_,__) => Container(
        width: size,
        height: size,
        color: Colors.grey[900],
      ),
      errorWidget: (_,__,___) => Container(
        width: size,
        height: size,
        color: Colors.grey[900],
        child: Icon(MdiIcons.alert, color: Colors.grey[400], size: 40),
      ),
    );
  }
}