import 'package:ashton_jones_dev_website/core/data/projects_data.dart';
import 'package:ashton_jones_dev_website/core/utils/JumpAndPhoneController.dart';
import 'package:ashton_jones_dev_website/core/utils/ScreenSize.dart';
import 'package:ashton_jones_dev_website/core/utils/WritingPencilController.dart';
import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:ashton_jones_dev_website/ui/widgets/project_widget.dart';
import 'package:ashton_jones_dev_website/ui/widgets/type_writer_text.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:simple_animations/simple_animations.dart';


class ProjectsTab extends StatefulWidget {
  @override
  _ProjectsTabState createState() => _ProjectsTabState();
}

class _ProjectsTabState extends State<ProjectsTab> {

  bool typewriter(double width) => width > 15;

  String _typewriterText = 'I am a software engineer';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
              itemCount: projects.length,
              itemBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 48),
                    child: ProjectWidget(projects[index]),
                  ))
        ],
      ),
    );
  }
}
