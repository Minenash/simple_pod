import 'package:xml/xml.dart';

import 'helpers.dart';

class PodcastOwner {
  final String name;
  final String email;

  PodcastOwner({this.name, this.email});

  factory PodcastOwner.parse(XmlElement element) {
    if (element == null) return null;
    return PodcastOwner(
        name: findString(element, "name"),
        email: findString(element, "email")
    );
  }
}

class RssEnclosure {
  final String url;
  final String type;
  final int length;

  RssEnclosure({this.url, this.type, this.length});

  factory RssEnclosure.parse(XmlElement element) {
    if (element == null) return null;
    return RssEnclosure(
      url: element.getAttribute("url"),
      type: element.getAttribute("type"),
      length: int.tryParse(element.getAttribute("length") ?? "0")
    );
  }
}