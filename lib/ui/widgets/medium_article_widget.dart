import 'package:ashton_jones_dev_website/core/data/model/medium_article.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;


class MediumArticleWidget extends StatelessWidget {

  final MediumArticle _mediumArticle;


  MediumArticleWidget(this._mediumArticle);

  openMediumArticleLink() {
    html.window.open(
        _mediumArticle.link, 'Medium Article Link');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: openMediumArticleLink,
      child: Card(
        elevation: 16,
        margin: EdgeInsets.fromLTRB(100, 48, 100, 48),
        child:Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO: Make sizing of article images consistent
                FittedBox(fit: BoxFit.fitWidth, child: Image.asset(_mediumArticle.imageResource, height: 300,)),
                SizedBox(height: 20),
                Text(_mediumArticle.title, style: Theme.of(context).textTheme.headline4,),
                SizedBox(height: 10),
                Text(_mediumArticle.subtitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.caption.copyWith(fontSize: 20),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(Icons.date_range),
                    ),
                    Text(_mediumArticle.datePublished, style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey.shade700),),
                  ],
                ),
                SizedBox(height: 40),
              ],
            )
        ),
      ),
    );
  }
}
