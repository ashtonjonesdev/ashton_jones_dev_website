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
    html.window.open(widget._mediumArticle.link, 'Medium Article Link');
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
      onTap: openMediumArticleLink,
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: _isHovering ? Colors.grey.shade300 : Colors.white,
        elevation: 16,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget._mediumArticle.title, style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,),
              SizedBox(height: 10,),
              Image.asset(widget._mediumArticle.imageResource, height: 300, width: 400,),
              SizedBox(height: 10,),
              widget._mediumArticle.subtitle != null ? Text(widget._mediumArticle.subtitle, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.caption.copyWith(fontStyle: FontStyle.italic),) : Container(width: 0, height: 0,),
              SizedBox(height: 10,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.date_range),
                  Text(widget._mediumArticle.datePublished),
                ],
              ),
            ],
          ),
        ),
      ),
      // child: Material(
      //   borderRadius: BorderRadius.circular(16),
      //   color: _isHovering ? Colors.grey.shade300 : Colors.white,
      //   elevation: 16,
      //   child: Flexible(
      //     fit: FlexFit.loose,
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         FittedBox(
      //             fit: BoxFit.fitWidth,
      //             child: Image.asset(
      //               widget._mediumArticle.imageResource,
      //               height: 300,
      //               width: 400,
      //             )),
      //         Expanded(child: SizedBox(height: 20)),
      //         Expanded(
      //             child: Text(
      //           widget._mediumArticle.title,
      //           style: Theme.of(context)
      //               .textTheme
      //               .bodyText2
      //               .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
      //           textAlign: TextAlign.center,
      //           softWrap: true,
      //           overflow: TextOverflow.ellipsis,
      //         )),
      //         Expanded(child: SizedBox(height: 10)),
      //         widget._mediumArticle.subtitle != null
      //             ? Expanded(
      //                 child: Text(
      //                 widget._mediumArticle.subtitle ?? '',
      //                 textAlign: TextAlign.center,
      //                 overflow: TextOverflow.ellipsis,
      //                 softWrap: true,
      //                 style: Theme.of(context)
      //                     .textTheme
      //                     .caption
      //                     .copyWith(fontSize: 16),
      //               ))
      //             : Expanded(
      //                 child: Container(
      //                 width: 0,
      //                 height: 0,
      //               )),
      //         Expanded(
      //             child: SizedBox(
      //           height: 5,
      //         )),
      //         Expanded(
      //           child: Row(
      //             mainAxisSize: MainAxisSize.min,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Expanded(
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(right: 8),
      //                   child: Icon(Icons.date_range),
      //                 ),
      //               ),
      //               Expanded(
      //                 child: Text(
      //                   widget._mediumArticle.datePublished,
      //                   style: Theme.of(context)
      //                       .textTheme
      //                       .caption
      //                       .copyWith(color: Colors.grey.shade700),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _isHovering = false;
  }
}
