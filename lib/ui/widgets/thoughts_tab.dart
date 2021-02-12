import 'package:ashton_jones_dev_website/core/data/medium_articles_data.dart';
import 'package:ashton_jones_dev_website/core/utils/ComputerProgrammerController.dart';
import 'package:ashton_jones_dev_website/core/utils/ScreenSize.dart';
import 'package:ashton_jones_dev_website/core/utils/WritingPencilController.dart';
import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:ashton_jones_dev_website/ui/widgets/article_widget.dart';
import 'package:ashton_jones_dev_website/ui/widgets/type_writer_text.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';


class ThoughtsTab extends StatefulWidget {
  @override
  _ThoughtsTabState createState() => _ThoughtsTabState();
}

class _ThoughtsTabState extends State<ThoughtsTab> {

  String _typewriterText = 'I am a storyteller';

  bool typewriter(double width) => width > 15;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: PlayAnimation<double>(
              duration: 400.milliseconds,
              tween: 0.0.tweenTo(80.0),
              builder: (context, child, height) {
                return PlayAnimation<double>(
                  duration: 1600.milliseconds,
                  delay: 500.milliseconds,
                  tween: 2.0.tweenTo(300.0),
                  builder: (context, child, width) {
                    return Container(
                      decoration: BoxDecoration(
                          color: kPrimaryColorLight,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withAlpha(50),
                                blurRadius: 15,
                                offset: Offset(0, 8),
                                spreadRadius: 5)
                          ]),
                      width: width,
                      height: height,
                      child: typewriter(width)
                          ? TypeWriterText(_typewriterText)
                          : Container(),
                    );
                  },
                );
              },
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: mediumArticles.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: ScreenSize.isSmallScreen(context) ?  EdgeInsets.symmetric(horizontal: 16, vertical: 16) : EdgeInsets.symmetric(horizontal: 48, vertical: 48),
                child: ArticleWidget(mediumArticles[index]),
              );
            },
          )
        ],
      ),
    );
  }
}
