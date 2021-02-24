import 'package:ashton_jones_dev_website/core/data/substack_articles_data.dart';
import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:ashton_jones_dev_website/ui/widgets/carousel_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';

import 'article_widget.dart';

class VenturesTab extends StatefulWidget {
  @override
  _VenturesTabState createState() => _VenturesTabState();
}

class _VenturesTabState extends State<VenturesTab> {
  String convertKitLandingPagePageSource =
      'https://ashtonjones.ck.page/2236a04fdb';

  static ValueKey convertKitLandingPagePageKey = ValueKey('convert_kit');

  List<CarouselWidget> carouselArticlesWidgets = [
    CarouselWidget(substackArticlesData[0]),
    CarouselWidget(substackArticlesData[1]),
    CarouselWidget(substackArticlesData[2]),
    CarouselWidget(substackArticlesData[3])
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Insight Owl',
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(fontWeight: FontWeight.bold, color: Colors.grey.shade700),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          // Text(
          //   'I publish a series each month that focuses on a certain topic.',
          //   style: Theme.of(context).textTheme.bodyText1,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Text(
          //   'Check out the first series on purpose:',
          //   style: Theme.of(context)
          //       .textTheme
          //       .bodyText1
          //       .copyWith(color: kPrimaryColorLight),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // CarouselSlider(
          //   items: carouselArticlesWidgets,
          //   options: CarouselOptions(
          //     height: 200.0,
          //     autoPlay: true,
          //     autoPlayInterval: Duration(seconds: 5),
          //     autoPlayAnimationDuration: Duration(milliseconds: 1000),
          //     autoPlayCurve: Curves.fastOutSlowIn,
          //     pauseAutoPlayOnTouch: true,
          //     aspectRatio: 2.0,
          //   ),
          // ),
          // SizedBox(
          //   height: 50,
          // ),
          Expanded(
            child: EasyWebView(
              src: 'https://ashtonjones.ck.page/104a28c6e1',
              webAllowFullScreen: false,
              onLoaded: () {
                print(
                    '$convertKitLandingPagePageKey: Loaded: $convertKitLandingPagePageSource');
              },
            ),
          ),
        ],
      ),
    );
  }
}
