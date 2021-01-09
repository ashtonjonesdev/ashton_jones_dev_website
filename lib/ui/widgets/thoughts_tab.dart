import 'package:ashton_jones_dev_website/core/data/model/medium_articles_data.dart';
import 'package:ashton_jones_dev_website/core/utils/ComputerProgrammerController.dart';
import 'package:ashton_jones_dev_website/core/utils/ScreenSize.dart';
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
  bool _switchValueTechnicalWriting = true;
  bool _switchValuePersonalWriting = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('I write articles on Medium'),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [Text('Technical writing'), Switch(value: _switchValueTechnicalWriting, onChanged: (value) {
          //     setState(() {
          //       _switchValueTechnicalWriting = value;
          //     });
          //   })],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [Text('Personal writing'), Switch(value: _switchValuePersonalWriting, onChanged: (value) {
          //     setState(() {
          //       _switchValuePersonalWriting = value;
          //     });
          //   })],
          // ),
          ScreenSize.isSmallScreen(context)
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: mediumArticles.length,
                  itemBuilder: (context, index) =>
                      MediumArticleWidget(mediumArticles[index]))
              : GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: mediumArticles.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
                      child: MediumArticleWidget(mediumArticles[index]),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
