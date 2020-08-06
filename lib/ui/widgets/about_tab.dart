import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:url_launcher/url_launcher.dart';


class AboutTab extends StatelessWidget {

  _launchUrl(String urlToLaunch) async {
    String url = urlToLaunch;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage:
                Image.asset('images/cool_profile_picture.jpg').image,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Ashton Jones',
                textScaleFactor: 4,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '📱 Expert Android and iOS Developer\n\n👨‍💻 Google Certified Android Engineer | ✍ Writer |🧘‍♂️ Stoic',
                style: Theme.of(context).textTheme.caption,
                textScaleFactor: 2,
                textAlign: TextAlign.center,
              ),
              Divider(
                height: 40,
                thickness: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Image.asset(
                        'images/android_logo.png',
                        width: 100,
                        height: 100,
                      )),
                  Expanded(
                      flex: 1,
                      child: Image.asset('images/java.png',
                          width: 100, height: 100)),
                  Expanded(
                      flex: 1,
                      child: Image.asset('images/flutter_logo.png',
                          width: 100, height: 100)),
                  Expanded(
                      flex: 1,
                      child: Image.asset('images/dart.png',
                          width: 100, height: 100)),
                ],
              ),
              Divider(
                height: 40,
                thickness: 5,
              ),
              Image.asset('images/androidify.gif'),
              Divider(
                height: 40,
                thickness: 5,
              ),
              GestureDetector(
                  onTap: () {
                    _launchUrl(
                        'https://www.ashtonjones.dev/images/GoogleCertifiedAndroidDeveloper.pdf');
                  },
                  child: Text(
                    'Associate Android Developer Certification',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.blue),
                  )),
              Row(
                children: [
                  Image.asset(
                    'images/associate_android_developer_badge.png',
                    height: 200,
                    width: 200,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'I earned an Associate Android Developer certification from the Google Developers Team, a course to help developers master core Android development skills and become competent Android engineers. \n\nBy the end of the course, I created over 30 bite-sized Android applications, created an Android game, mastered core Android development and mobile development best practices, and became 1 of 153 Google Certified Android Engineers in North America.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 40,
                thickness: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.mail),
                    label: Text('Email'),
                    onPressed: () => html.window.open(
                        'mailto:ashtonjonesdev@gmail.com', 'ashtonjonesdev'),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('images/linkedin.png')),
                    label: Text('Linkedin'),
                    onPressed: () => html.window.open(
                        'https://www.linkedin.com/in/tjgrapes/',
                        'Ashton Jones'),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('images/google_play_icon.png')),
                    label: Text('Google Play Store'),
                    onPressed: () => html.window.open(
                        'https://play.google.com/store/apps/dev?id=8786079395794167171',
                        'Ashton Jones Google Play Developer Page'),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('images/medium_icon.jpg')),
                    label: Text('Medium'),
                    onPressed: () => html.window
                        .open('https://medium.com/@TJgrapes', 'TJgrapes'),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('images/github.png')),
                    label: Text('Github'),
                    onPressed: () => html.window.open(
                        'https://github.com/ashtonjonesdev', 'ashtonjonesdev'),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('images/twitter.png')),
                    label: Text('Twitter'),
                    onPressed: () => html.window
                        .open('https://twitter.com/TJgrapes', 'TJgrapes'),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('images/facebook.png')),
                    label: Text('Facebook'),
                    onPressed: () => html.window
                        .open('https://www.facebook.com/TJgrapes', 'TJgrapes'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}