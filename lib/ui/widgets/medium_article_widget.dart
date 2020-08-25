import 'package:ashton_jones_dev_website/core/data/model/medium_article.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;


class MediumArticleWidget extends StatefulWidget {

  final MediumArticle _mediumArticle;


  MediumArticleWidget(this._mediumArticle);

  @override
  _MediumArticleWidgetState createState() => _MediumArticleWidgetState();

}

class _MediumArticleWidgetState extends State<MediumArticleWidget> {

  Color cardBackgroundColor = Colors.white;



  openMediumArticleLink() {
    html.window.open(
        widget._mediumArticle.link, 'Medium Article Link');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: openMediumArticleLink,
      onHover: (bool) {
        setState(() {
          cardBackgroundColor = Colors.grey.shade200;
        });
      },
      child: Card(
        color: cardBackgroundColor,
        elevation: 16,
        margin: EdgeInsets.fromLTRB(100, 48, 100, 48),
        child:Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO: Make sizing of article images consistent
                FittedBox(fit: BoxFit.fitWidth, child: Image.asset(widget._mediumArticle.imageResource, height: 300,)),
                SizedBox(height: 20),
                Text(widget._mediumArticle.title, style: Theme.of(context).textTheme.headline4, textAlign: TextAlign.center,),
                SizedBox(height: 10),
                Text(widget._mediumArticle.subtitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.caption.copyWith(fontSize: 20),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(Icons.date_range),
                    ),
                    Text(widget._mediumArticle.datePublished, style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey.shade700),),
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

