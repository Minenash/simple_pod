import 'package:jiffy/jiffy.dart';
import 'package:xml/xml.dart';

import 'helpers.dart';
import 'structures.dart';

class PodcastEpisode {

  final String title; //itunes
  final String fullTitle;
  final String description;
  final String subtitle; //itunes
  final String summary; //itunes
  final String showNotes;

  final String link;
  final String guild;
  final String author;
  final String image;
  final bool explicit;
  final int duration;
  final Jiffy pubDate;
  final RssEnclosure enclosure;

  PodcastEpisode({this.description, this.link, this.guild, this.author,
      this.title, this.fullTitle, this.subtitle, this.summary, this.showNotes,
      this.explicit, this.duration, this.pubDate, this.enclosure, this.image});

  factory PodcastEpisode.parse(XmlElement e) {

    if (e == null) return null;

    String iTitle = findString(e, "itunes:title");
    String rTitle = findString(e, "title");
    String summary = findString(e, "summarry");
    String description = findString(e, "description");
    String link = findString(e, "link");
    String guild = findString(e, "guild");

    return PodcastEpisode(
      title:       iTitle ?? rTitle,
      fullTitle:   rTitle ?? iTitle,
      subtitle:    findString(e, "subtitle"),
      description: description ?? summary,
      summary:     summary ?? description,
      link:        link ?? guild ,
      guild:       guild ?? link,
      author:      findString(e, "author"),
      showNotes:   findString(e, "content:encoded") ??
                   summary ?? description ?? "<b>No Show Notes</b>",

      explicit:  findBool(e, "explicit"),
      duration:  findInt(e, "duration"),
      pubDate:   findDate(e, "pubDate"),
      enclosure: RssEnclosure.parse( find(e, "enclosure") ),
      image:     find(e, "itunes:image")?.getAttribute("href"),
    );
  }


}