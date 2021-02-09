import 'package:flutter/foundation.dart';

class SubstackArticle {
  String title;
  String subtitle;
  String imageResource;
  String link;
  String datePublished;

  SubstackArticle({@required this.title, @required this.subtitle, @required this.imageResource, @required this.link,
    @required this.datePublished});
}