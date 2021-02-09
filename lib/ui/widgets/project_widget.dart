import 'package:ashton_jones_dev_website/core/data/model/project.dart';
import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:flutter/widgets.dart';

class ProjectWidget extends StatelessWidget {
  final Project _project;

  ProjectWidget(this._project);

  openGooglePlayStoreLink() {
    if (_project.googlePlayStoreLink != null) {
      html.window.open(_project.googlePlayStoreLink, 'Google Play Store Link');
    }
  }

  openAppleAppStoreLink() {
    if (_project.appleAppStoreLink != null) {
      html.window.open(_project.appleAppStoreLink, 'Apple App Store Link');
    }
  }

  openGithubLink() {
    if (_project.githubLink != null) {
      html.window.open(_project.githubLink, 'Github Link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      elevation: 16,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _project.title,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Colors.black),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset(
                _project.projectIconResource,
                width: 48,
                height: 48,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _project.shortDescription,
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: kPrimaryColorLight),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _project.longDescription,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(_project.projectGIFResource),
              SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  Icon(Icons.date_range),
                  Text(
                    _project.dateLaunched,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Icon(Icons.code),
                  Text(
                    _project.technologiesUsed.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Wrap(
                children: [
                  Icon(Icons.computer_sharp),
                  Text(
                    _project.platforms.toString(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _project.githubLink != null
                  ? InkWell(
                      onTap: openGithubLink,
                      child: Image.asset(
                        'images/github.png',
                        width: 100,
                        height: 100,
                      ))
                  : Container(),
              _project.appleAppStoreLink != null
                  ? InkWell(
                      onTap: openAppleAppStoreLink,
                      child: Image.asset(
                        'images/apple_app_store.png',
                        width: 200,
                        height: 100,
                      ))
                  : Container(),
              _project.googlePlayStoreLink != null
                  ? InkWell(
                      onTap: openGooglePlayStoreLink,
                      child: Image.asset(
                        'images/google_play_store_badge.png',
                        width: 200,
                        height: 100,
                      ))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
