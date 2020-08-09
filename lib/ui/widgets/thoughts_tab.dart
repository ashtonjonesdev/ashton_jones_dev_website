import 'package:ashton_jones_dev_website/core/data/model/medium_articles_data.dart';
import 'package:ashton_jones_dev_website/ui/widgets/medium_article_widget.dart';
import 'package:flutter/material.dart';

class ThoughtsTab extends StatefulWidget {
  @override
  _ThoughtsTabState createState() => _ThoughtsTabState();
}

class _ThoughtsTabState extends State<ThoughtsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: mediumArticles.length,itemBuilder: (context, index) => MediumArticleWidget(mediumArticles[index]));
  }
}
