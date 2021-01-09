import 'package:ashton_jones_dev_website/core/data/model/medium_article.dart';
import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;


class MediumArticleWidget extends StatefulWidget {

  final MediumArticle _mediumArticle;


  MediumArticleWidget(this._mediumArticle);

  @override
  _MediumArticleWidgetState createState() => _MediumArticleWidgetState();

}

class _MediumArticleWidgetState extends State<MediumArticleWidget> {

  bool _isHovering = false;



  openMediumArticleLink() {
    html.window.open(
        widget._mediumArticle.link, 'Medium Article Link');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (isHovering) {
        if(isHovering) {
          setState(() {
            _isHovering = isHovering;
          });
        }
        else {
          setState(() {
            _isHovering = isHovering;
          });
        }
      },
      onTap: openMediumArticleLink,
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: _isHovering ? Colors.grey.shade300 : Colors.white,
        elevation: 16,
        child:Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(fit: BoxFit.fitWidth, child: Image.asset(widget._mediumArticle.imageResource, height: 300, width: 400,)),
                SizedBox(height: 20),
                Text(widget._mediumArticle.title, style: Theme.of(context).textTheme.headline4, textAlign: TextAlign.center,),
                SizedBox(height: 10),
                widget._mediumArticle.subtitle != null ? Text(widget._mediumArticle.subtitle ?? '', textAlign: TextAlign.center, style: Theme.of(context).textTheme.caption.copyWith(fontSize: 20),) : Container(),
                SizedBox(height: 10,),
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(Icons.date_range),
                      ),
                      Text(widget._mediumArticle.datePublished, style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey.shade700),),
                    ],
                  ),
                ),
              ],
            )
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

