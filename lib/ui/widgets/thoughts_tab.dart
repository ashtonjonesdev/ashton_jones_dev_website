import 'package:ashton_jones_dev_website/core/data/model/medium_articles_data.dart';
import 'package:ashton_jones_dev_website/core/utils/ComputerProgrammerController.dart';
import 'package:ashton_jones_dev_website/core/utils/WritingPencilController.dart';
import 'package:ashton_jones_dev_website/ui/widgets/medium_article_widget.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class ThoughtsTab extends StatefulWidget {
  @override
  _ThoughtsTabState createState() => _ThoughtsTabState();
}

class _ThoughtsTabState extends State<ThoughtsTab> {

  WritingPencilController _writingPencilController = WritingPencilController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75,
          child: FlareActor(
            'assets/writing.flr',
            controller: _writingPencilController,
            shouldClip: false,
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: mediumArticles.length,
              itemBuilder: (context, index) =>
                  MediumArticleWidget(mediumArticles[index])),
        ),
      ],
    );
  }
}
