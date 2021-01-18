

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

    Size containerSize = MediaQuery.of(context).size;

    return Material(
      elevation: 16,
      borderRadius: BorderRadius.circular(16),
      child:Container(
        constraints: BoxConstraints.tight(containerSize),
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(_project.projectIconResource, width: 100, height: 100,),
            Text(_project.title, style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center, softWrap: true, overflow: TextOverflow.visible,),
            Text(_project.shortDescription, textAlign: TextAlign.center, style: Theme.of(context).textTheme.caption.copyWith(color: kPrimaryColorLight), softWrap: true, overflow: TextOverflow.visible,),
            SizedBox(height: 10,),
            Expanded(child: Text(_project.longDescription, style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16, color: Colors.grey.shade700), softWrap: true,)),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(Icons.date_range),
                ),
                Expanded(child: Text(_project.dateLaunched, style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey.shade700),)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
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
            SizedBox(height: 10),
            Expanded(child: Image.asset(_project.projectGIFResource, height: 300,)),
            _project.githubLink != null ?  Expanded(child: InkWell( onTap: openGithubLink, child: Image.asset(_project.githubLink != null ? 'images/github.png' : '', width: 100, height: 100,))) : Container(width: 0, height: 0,),
            _project.googlePlayStoreLink != null ?  Expanded(child: InkWell( onTap: openGooglePlayStoreLink, child: Image.asset(_project.googlePlayStoreLink != null ? 'images/google_play_store_badge.png' : '', width:200, height: 100))) : Container(width: 0, height: 0,),
            _project.appleAppStoreLink != null ?  Expanded(child: InkWell( onTap: openAppleAppStoreLink, child: Image.asset(_project.appleAppStoreLink != null ? 'images/apple_app_store.png' : '', width: 200, height: 100,))) : Container(width: 0, height: 0,)

          ],
        ),
      ),
    );
  }


}
