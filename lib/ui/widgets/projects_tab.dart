import 'package:ashton_jones_dev_website/core/data/projects_data.dart';
import 'package:ashton_jones_dev_website/ui/widgets/project_widget.dart';
import 'package:flutter/material.dart';

class ProjectsTab extends StatefulWidget {
  @override
  _ProjectsTabState createState() => _ProjectsTabState();
}

class _ProjectsTabState extends State<ProjectsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: projects.length,itemBuilder: (context, index) => ProjectWidget(projects[index]));
  }
}

