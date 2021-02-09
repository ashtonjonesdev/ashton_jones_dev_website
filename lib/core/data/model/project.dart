import 'package:flutter/cupertino.dart';

class Project {

  String title;
  String shortDescription;
  String longDescription;
  String projectIconResource;
  String projectGIFResource;
  String googlePlayStoreLink;
  String appleAppStoreLink;
  String githubLink;
  String dateLaunched;
  List<String> technologiesUsed;
  List<String> platforms;

  Project({@required this.title, @required this.shortDescription, @required this.projectIconResource, @required this.dateLaunched, this.technologiesUsed, this.longDescription,
    this.projectGIFResource, this.googlePlayStoreLink, this.appleAppStoreLink, this.githubLink, this.platforms});
}