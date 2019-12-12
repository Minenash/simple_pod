import 'package:jiffy/jiffy.dart';
import 'package:xml/xml.dart';

import 'PodcastEpisode.dart';
import 'helpers.dart';
import 'structures.dart';

class PodcastFeed {

  final String title;
  final String link;
  final String description;
  final String language;
  final String copyright;
  final String author; //itunes
  final String artwork; //image-itunes
  final List<String> keywords; //itunes
  final List<String> categories; //itunes

  final bool explicit; //itunes
  final bool block; //itunes
  
  final Jiffy pubDate;
  final PodcastOwner owner; //name&email-itunes
  final List<PodcastEpisode> episodes;

  PodcastFeed({this.title, this.link, this.pubDate, this.description,
      this.language, this.copyright, this.author, this.keywords, this.explicit,
      this.artwork, this.owner, this.block, this.categories, this.episodes});



  factory PodcastFeed.parse(String feed) {
    XmlDocument document = parse(feed);
    XmlElement c = document?.findAllElements("channel")?.first;

    if (c == null) return null;

    return PodcastFeed(
      title:       findString(c, "title"),
      link:        findString(c, "link"),
      description: findString(c, "description"),
      language:    findString(c, "language"),
      copyright:   findString(c, "copyright"),
      author:      findString(c, "itunes:author"),
      artwork:     find(c, "itunes:image")?.getAttribute("href"),
      keywords:    findString(c, "itunes:keywords")?.split(", "),

      explicit: findBool(c, "itunes:explicit"),
      block:    findBool(c, "itunes:block"),

      pubDate:    findDate(c, "pubDate"),
      owner:      PodcastOwner.parse( find(c, "owner") ),
      categories: findAll(c, "category")?.map( (e) => e.getAttribute("text")?.trim() )?.toList(),
      episodes:   findAll(c, "item")?.map( (e) => PodcastEpisode.parse(e) ).toList(),
    );
  }

}



