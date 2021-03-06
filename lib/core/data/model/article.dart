import 'package:flutter/cupertino.dart';

enum ArticleType {
  TECHNICAL,
  PERSONAL
}

class Article {

  String title;
  String subtitle;
  String imageResource;
  String link;
  String datePublished;
  ArticleType articleType;

  Article({@required this.title, this.subtitle, @required this.imageResource, @required this.link,
    @required this.datePublished, this.articleType});
}