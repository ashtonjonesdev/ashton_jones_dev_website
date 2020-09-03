import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';
import 'package:ashton_jones_dev_website/core/utils/HoverExtentions.dart';

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
    var screenSize = MediaQuery.of(context).size;

    return screenSize.width < 800
        ? SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        'Ashton Jones',
                        textAlign: TextAlign.center,
                        textScaleFactor: 4,
                      ),
                    ).showCursorOnHover,
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '📱 Expert Android and iOS Developer\n\n👨🏻‍💻 Google Certified Android Engineer | ✍🏻 Writer |🧘‍♂️ Stoic',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.grey.shade700),
                      textScaleFactor: 2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Image.asset('images/ash.png', fit: BoxFit.contain),
                    SizedBox(
                      height: 20,
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
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        _launchUrl('https://github.com/ashtonjonesdev');
                      },
                      child: Text(
                        'Software Engineering 🖥',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.blue, height: 1.1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                          'My expertise is in Android and iOS mobile app development. I can build cross-platform apps for Android and iOS using Flutter and native apps for Android using Java and the Android SDK.\n\nI have built complete Flutter and Android apps from scratch and published them to the Google Play Store and the Apple App Store.\n\nThe primary technologies I use are the Flutter SDK, Android SDK, Java, and Dart.\n\nI have experience using Firebase Cloud Firestore, Firebase authentication, MVVM architecture, authentication with Google and Apple, Android Architecture Components, observer patterns (Provider- Flutter; Live Data & Observer- Android), and Material Design.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 16)),
                    ),
                    Divider(
                      height: 40,
                      thickness: 5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        _launchUrl(
                            'https://images.credential.net/embed/x146el0j.png');
                      },
                      child: Text(
                        'Credentials 🔖',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.blue, height: 1.1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'images/associate_android_developer_badge.png',
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'I earned an Associate Android Developer certification from the Google Developers Team, a course to help developers master core Android development skills and become competent Android engineers. \n\nBy the end of the course, I created over 30 bite-sized Android applications, created an Android game, mastered core Android development and mobile development best practices, and became 1 of 153 Google Certified Android Engineers in North America.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: 16),
                      ),
                    ),
                    Divider(
                      height: 40,
                      thickness: 5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        _launchUrl('https://medium.com/@TJgrapes');
                      },
                      child: Text(
                        'Technical Writing ✍🏼',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.blue, height: 1.1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'images/firebase_developers_publication.png',
                      width: 200,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                          'I write technical articles on Flutter on Android and enjoy educating others. My work has been published in "Firebase Developers", a Medium publication run by the Google Firebase team.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 16)),
                    ),
                    Divider(
                      height: 40,
                      thickness: 5,
                    ),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        _launchUrl(
                            'https://www.instagram.com/p/B9R3sfRFHy4/?igshid=1ntltciv11712');
                      },
                      child: Text(
                        'Startup 🚀',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.blue, height: 1.1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'images/tech_day_me.png',
                      width: 200,
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                          'I have first hand experience building a startup and am a member of Domi Station. I am involved in the Tallahassee startup community, and a board member of Entrepreneurship Tallahassee, an organization which schedules Startup Week Tallahassee and promotes entrepreneurship.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 16)),
                    ),
                    Divider(
                      height: 40,
                      thickness: 5,
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Icon(Icons.mail),
                            label: Expanded(
                                flex: 1,
                                child: Text('Email',
                                    overflow: TextOverflow.visible,
                                    softWrap: false)),
                            onPressed: () => html.window.open(
                                'mailto:ashtonjonesdev@gmail.com',
                                'ashtonjonesdev'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Image.asset('images/linkedin.png',
                                width: 20, height: 20),
                            label: Expanded(
                                flex: 1,
                                child: Text(
                                  'Linkedin',
                                  overflow: TextOverflow.visible,
                                  softWrap: false,
                                )),
                            onPressed: () => html.window.open(
                                'https://www.linkedin.com/in/tjgrapes/',
                                'Ashton Jones'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Image.asset('images/google_play_icon.png',
                                width: 20, height: 20),
                            label: Expanded(
                                flex: 1,
                                child: Text(
                                  'Play Store',
                                  overflow: TextOverflow.visible,
                                  softWrap: false,
                                )),
                            onPressed: () => html.window.open(
                                'https://play.google.com/store/apps/dev?id=8786079395794167171',
                                'Ashton Jones Google Play Developer Page'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Image.asset('images/medium_icon.jpg',
                                width: 20, height: 20),
                            label: Expanded(
                                flex: 1,
                                child: Text(
                                  'Medium',
                                  overflow: TextOverflow.visible,
                                  softWrap: false,
                                )),
                            onPressed: () => html.window.open(
                                'https://medium.com/@TJgrapes', 'TJgrapes'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Image.asset(
                              'images/github.png',
                              height: 20,
                              width: 20,
                            ),
                            label: Expanded(
                              flex: 1,
                              child: Text(
                                'Github',
                                overflow: TextOverflow.visible,
                                softWrap: false,
                              ),
                            ),
                            onPressed: () => html.window.open(
                                'https://github.com/ashtonjonesdev',
                                'ashtonjonesdev'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Image.asset(
                              'images/dev.to_logo.png',
                              height: 20,
                              width: 20,
                            ),
                            label: Expanded(
                              flex: 1,
                              child: Text(
                                'Dev.to',
                                overflow: TextOverflow.visible,
                                softWrap: false,
                              ),
                            ),
                            onPressed: () => html.window
                                .open('https://dev.to/tjgrapes', 'dev.to'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Image.asset(
                              'images/twitter.png',
                              width: 20,
                              height: 20,
                            ),
                            label: Expanded(
                                flex: 1,
                                child: Text('Twitter',
                                    overflow: TextOverflow.visible,
                                    softWrap: false)),
                            onPressed: () => html.window.open(
                                'https://twitter.com/TJgrapes', 'TJgrapes'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Image.asset(
                              'images/facebook.png',
                              width: 20,
                              height: 20,
                            ),
                            label: Expanded(
                                flex: 1,
                                child: Text(
                                  'Facebook',
                                  overflow: TextOverflow.visible,
                                  softWrap: false,
                                )),
                            onPressed: () => html.window.open(
                                'https://www.facebook.com/TJgrapes',
                                'TJgrapes'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        : SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Ashton Jones',
                      textScaleFactor: 4,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '📱 Expert Android and iOS Developer\n\n👨🏻‍💻 Google Certified Android Engineer | ✍🏻 Writer |🧘🏻️ Stoic',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.grey.shade700),
                      textScaleFactor: 2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Image.asset('images/ash.png', fit: BoxFit.contain),
                    SizedBox(
                      height: 20,
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
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        _launchUrl('https://github.com/ashtonjonesdev');
                      },
                      child: Text(
                        'Software Engineering 🖥',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.blue, height: 1.1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                          'My expertise is in Android and iOS mobile app development. I can build cross-platform apps for Android and iOS using Flutter and native apps for Android using Java and the Android SDK.\n\nI have built complete Flutter and Android apps from scratch and published them to the Google Play Store and the Apple App Store.\n\nThe primary technologies I use are the Flutter SDK, Android SDK, Java, and Dart.\n\nI have experience using Firebase Cloud Firestore, Firebase authentication, MVVM architecture, authentication with Google and Apple, Android Architecture Components, observer patterns (Provider- Flutter; Live Data & Observer- Android), and Material Design.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 16)),
                    ),
                    Divider(
                      height: 40,
                      thickness: 5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        _launchUrl(
                            'https://images.credential.net/embed/x146el0j.png');
                      },
                      child: Text(
                        'Credentials 🔖',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.blue, height: 1.1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'images/associate_android_developer_badge.png',
                          height: 200,
                          width: 200,
                        ),
                        Image.asset(
                          'images/google_certification.png',
                          height: 200,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'I earned an Associate Android Developer certification from the Google Developers Team, a course to help developers master core Android development skills and become competent Android engineers. \n\nBy the end of the course, I created over 30 bite-sized Android applications, created an Android game, mastered core Android development and mobile development best practices, and became 1 of 153 Google Certified Android Engineers in North America.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: 16),
                      ),
                    ),
                    Divider(
                      height: 40,
                      thickness: 5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        _launchUrl('https://medium.com/@TJgrapes');
                      },
                      child: Text(
                        'Technical Writing ✍🏼',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.blue, height: 1.1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'images/firebase_developers_publication.png',
                          width: 400,
                        ),
                        Image.asset(
                          'images/android_publication.png',
                          width: 400,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                          'I write technical articles on Flutter on Android and enjoy educating others. My work has been published in "Firebase Developers", a Medium publication run by the Google Firebase team.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 16)),
                    ),
                    Divider(
                      height: 40,
                      thickness: 5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        _launchUrl(
                            'https://www.instagram.com/p/B9R3sfRFHy4/?igshid=1ntltciv11712');
                      },
                      child: Text(
                        'Startup 🚀',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.blue, height: 1.1),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'images/tech_day_me.png',
                          width: 400,
                        ),
                        Image.asset(
                          'images/tech_day_setup.png',
                          width: 400,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                          'I have first hand experience building a startup and am a member of Domi Station. I am involved in the Tallahassee startup community, and a board member of Entrepreneurship Tallahassee, an organization which schedules Startup Week Tallahassee and promotes entrepreneurship.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 16)),
                    ),
                    Divider(
                      height: 40,
                      thickness: 5,
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Icon(Icons.mail),
                            label: Expanded(
                                flex: 1,
                                child: Text('Email',
                                    overflow: TextOverflow.visible,
                                    softWrap: false)),
                            onPressed: () => html.window.open(
                                'mailto:ashtonjonesdev@gmail.com',
                                'ashtonjonesdev'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Image.asset('images/linkedin.png',
                                width: 20, height: 20),
                            label: Expanded(
                                flex: 1,
                                child: Text(
                                  'Linkedin',
                                  overflow: TextOverflow.visible,
                                  softWrap: false,
                                )),
                            onPressed: () => html.window.open(
                                'https://www.linkedin.com/in/tjgrapes/',
                                'Ashton Jones'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Image.asset('images/google_play_icon.png',
                                width: 20, height: 20),
                            label: Expanded(
                                flex: 1,
                                child: Text(
                                  'Play Store',
                                  overflow: TextOverflow.visible,
                                  softWrap: false,
                                )),
                            onPressed: () => html.window.open(
                                'https://play.google.com/store/apps/dev?id=8786079395794167171',
                                'Ashton Jones Google Play Developer Page'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Image.asset('images/medium_icon.jpg',
                                width: 20, height: 20),
                            label: Expanded(
                                flex: 1,
                                child: Text(
                                  'Medium',
                                  overflow: TextOverflow.visible,
                                  softWrap: false,
                                )),
                            onPressed: () => html.window.open(
                                'https://medium.com/@TJgrapes', 'TJgrapes'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Image.asset(
                              'images/github.png',
                              height: 20,
                              width: 20,
                            ),
                            label: Expanded(
                              flex: 1,
                              child: Text(
                                'Github',
                                overflow: TextOverflow.visible,
                                softWrap: false,
                              ),
                            ),
                            onPressed: () => html.window.open(
                                'https://github.com/ashtonjonesdev',
                                'ashtonjonesdev'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Image.asset(
                              'images/dev.to_logo.png',
                              height: 20,
                              width: 20,
                            ),
                            label: Expanded(
                              flex: 1,
                              child: Text(
                                'Dev.to',
                                overflow: TextOverflow.visible,
                                softWrap: false,
                              ),
                            ),
                            onPressed: () => html.window
                                .open('https://dev.to/tjgrapes', 'dev.to'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Image.asset(
                              'images/twitter.png',
                              width: 20,
                              height: 20,
                            ),
                            label: Expanded(
                                flex: 1,
                                child: Text('Twitter',
                                    overflow: TextOverflow.visible,
                                    softWrap: false)),
                            onPressed: () => html.window.open(
                                'https://twitter.com/TJgrapes', 'TJgrapes'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            icon: Image.asset(
                              'images/facebook.png',
                              width: 20,
                              height: 20,
                            ),
                            label: Expanded(
                                flex: 1,
                                child: Text(
                                  'Facebook',
                                  overflow: TextOverflow.visible,
                                  softWrap: false,
                                )),
                            onPressed: () => html.window.open(
                                'https://www.facebook.com/TJgrapes',
                                'TJgrapes'),
                          ),
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

//
//
//

//
