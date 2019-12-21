import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:simple_pod/AppTheme.dart';

class ArtworkImage extends StatelessWidget {

  String src;
  double size;

  ArtworkImage(this.src, this.size);

  @override
  Widget build(BuildContext context) {

    if (src == null) return placeholder();

    return CachedNetworkImage(
      imageUrl: src,
      fadeInDuration: Duration(seconds: 1),
      placeholder: (_,__) => placeholder(),
      errorWidget: (_,__,___) => Container(
        width: size,
        height: size,
        color: AppTheme.raised,
        child: Icon(MdiIcons.alert, color: AppTheme.secondary, size: 40),
      ),
    );
  }

  Widget placeholder() => Container(
    width: size,
    height: size,
    color: AppTheme.raised,
  );
}