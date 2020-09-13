

import 'package:ashton_jones_dev_website/core/data/model/project.dart';
import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;


class ProjectWidget extends StatelessWidget {
  final Project _project;

  ProjectWidget(this._project);

  openGooglePlayStoreLink() {
    if(_project.googlePlayStoreLink != null) {

      html.window.open(
          _project.googlePlayStoreLink, 'Google Play Store Link');
    }
  }
  openAppleAppStoreLink() {
    if(_project.appleAppStoreLink != null) {
      html.window.open(
          _project.appleAppStoreLink, 'Apple App Store Link');
    }
  }
  openGithubLink() {
    if(_project.githubLink != null) {
      html.window.open(
          _project.githubLink, 'Github Link');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 16,
      margin: EdgeInsets.all(48),
      child:Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(_project.projectIconResource, width: 100, height: 100,),
                SizedBox(width: 10),
                Flexible(child: Text(_project.title, style: Theme.of(context).textTheme.headline4,)),
              ],
            ),
            Text(_project.shortDescription, textAlign: TextAlign.center, style: Theme.of(context).textTheme.caption.copyWith(color: kPrimaryColorLight, fontSize: 20),),
            SizedBox(height: 20,),
            Text(_project.longDescription, style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16, color: Colors.grey.shade700),),
            SizedBox(height: 20,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(Icons.date_range),
                ),
                Text(_project.dateLaunched, style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey.shade700),),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.laptop_mac
                  ),
                ),
                Expanded(flex: 1,child: Text(_project.technologiesUsed.toString(), softWrap: true, overflow: TextOverflow.visible, style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey.shade700),))
              ],
            ),
            SizedBox(height: 40),
            Image.asset(_project.projectGIFResource, height: 500,),
            InkWell( onTap: openGithubLink, child: Image.asset(_project.githubLink != null ? 'images/github_logo.png' : 'images/small_placeholder.png',  width: 200, height: 100,)),
            InkWell( onTap: openGooglePlayStoreLink, child: Image.asset(_project.googlePlayStoreLink != null ? 'images/google_play_store_badge.png' : 'images/small_placeholder.png',  width: 200, height: 100,)),
            InkWell(onTap: openAppleAppStoreLink, child: Image.asset(_project.appleAppStoreLink != null ? 'images/apple_app_store.png' : 'images/small_placeholder.png', width: 200, height: 100,)),
          ],
        )
      ),
    );
  }


}
