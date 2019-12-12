import 'package:jiffy/jiffy.dart';
import 'package:xml/xml.dart';

XmlElement find(XmlElement element, String name) {
  try {
    return element.findAllElements(name).first;
  }  on StateError {
    return null;
  }
}

Iterable<XmlElement> findAll(XmlElement element, String name) {
  try {
    return element.findAllElements(name);
  }  on StateError {
    return null;
  }
}

String findString(XmlElement element, String name) {
  return find(element, name)?.text;
}

bool findBool(XmlElement element, String name) {
  String v = find(element, name)?.text?.toLowerCase()?.trim();
  return v == null? null : ["yes", "true"].contains(v);
}

Jiffy findDate(XmlElement element, String name) {
  String dateStr = findString(element, "pubDate");
  return dateStr == null ? null : Jiffy(dateStr, "E, d MMM y H:m:s zzz");
}

int findInt(XmlElement element, String name) {
  String v = find(element, name)?.text?.trim();
  return v == null? 0 : int.parse(v);
}