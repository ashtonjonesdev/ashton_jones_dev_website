import 'package:ashton_jones_dev_website/core/data/substack_articles_data.dart';
import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:ashton_jones_dev_website/ui/widgets/carousel_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'article_widget.dart';

class VenturesTab extends StatefulWidget {
  @override
  _VenturesTabState createState() => _VenturesTabState();
}

class _VenturesTabState extends State<VenturesTab> {

  List<CarouselWidget> carouselArticlesWidgets = [CarouselWidget(substackArticlesData[0]), CarouselWidget(substackArticlesData[1]), CarouselWidget(substackArticlesData[2]), CarouselWidget(substackArticlesData[3])];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('images/Insight_Owl_transparent.png'),
            SizedBox(height: 10,),
            Text('In Insight Owl, I share lessons learned from my personal experiences and extrapolate knowledge from them in hopes of helping you to think deeply to uncover your truths, and ultimately, know yourself at a deeper level.', style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Text('I publish a series each month that focuses on a certain topic.', style: Theme.of(context).textTheme.bodyText1,),
            SizedBox(height: 10,),
            Text('Check out the first series on purpose:', style: Theme.of(context).textTheme.bodyText1.copyWith(color: kPrimaryColorLight),),
            SizedBox(height: 20,),
            CarouselSlider(items: carouselArticlesWidgets, options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
            ),),
            SizedBox(height: 50,),

          ],
        ),
      ),
    );
  }
}
