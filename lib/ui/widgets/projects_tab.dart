import 'package:ashton_jones_dev_website/core/data/projects_data.dart';
import 'package:ashton_jones_dev_website/core/utils/JumpAndPhoneController.dart';
import 'package:ashton_jones_dev_website/core/utils/WritingPencilController.dart';
import 'package:ashton_jones_dev_website/ui/widgets/project_widget.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class ProjectsTab extends StatefulWidget {
  @override
  _ProjectsTabState createState() => _ProjectsTabState();
}

class _ProjectsTabState extends State<ProjectsTab> {

  JumpAndPhoneController _jumpAndPhoneController = JumpAndPhoneController();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Container(
            height: 75,
            child: FlareActor(
              'assets/jump_and_phone.flr',
              shouldClip: false,
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
              controller: _jumpAndPhoneController,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(itemCount: projects.length,itemBuilder: (context, index) => ProjectWidget(projects[index])),
        ),
      ],
    );

  }
}

