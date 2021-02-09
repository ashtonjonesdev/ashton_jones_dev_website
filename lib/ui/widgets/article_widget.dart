import 'package:ashton_jones_dev_website/core/data/model/article.dart';
import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class ArticleWidget extends StatefulWidget {
  final Article _article;

  ArticleWidget(this._article);

  @override
  _ArticleWidgetState createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  bool _isHovering = false;

  openArticleLink() {
    html.window.open(widget._article.link, 'Article Link');
  }

  @override
  Widget build(BuildContext context) {



    return InkWell(
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            _isHovering = isHovering;
          });
        } else {
          setState(() {
            _isHovering = isHovering;
          });
        }
      },
      onTap: openArticleLink,
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: _isHovering ? Colors.grey.shade300 : Colors.white,
        elevation: 16,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Text(widget._article.title, style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center, softWrap: true,),
              SizedBox(height: 10,),
              Image.asset(widget._article.imageResource, height: 300, width: 400,),
              SizedBox(height: 10,),
              widget._article.subtitle != null ? Text(widget._article.subtitle, textAlign: TextAlign.center, softWrap: true, style: Theme.of(context).textTheme.caption.copyWith(fontStyle: FontStyle.italic, color: kPrimaryColorLight),) : Container(width: 0, height: 0,),
              SizedBox(height: 10,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.date_range),
                  Text(widget._article.datePublished),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _isHovering = false;
  }
}
