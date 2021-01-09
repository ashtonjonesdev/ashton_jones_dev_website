import 'package:flutter/cupertino.dart';

enum ArticleType {
  TECHNICAL,
  PERSONAL
}

class MediumArticle {

  String title;
  String subtitle;
  String imageResource;
  String link;
  String datePublished;
  ArticleType articleType;

  MediumArticle({@required this.title, this.subtitle, @required this.imageResource, @required this.link,
    @required this.datePublished, @required this.articleType});
}