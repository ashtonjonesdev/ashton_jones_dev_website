import 'package:ashton_jones_dev_website/core/utils/ScreenSize.dart';
import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';
import 'package:ashton_jones_dev_website/core/utils/HoverExtentions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


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
                    Text(
                      'Ashton Jones',
                      textAlign: TextAlign.center,
                      textScaleFactor: 6,
                      style: GoogleFonts.aldrich().copyWith(letterSpacing: 3),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SelectableText(
                      '📱 Expert Android and iOS Developer\n\n👨🏻‍💻 Google Certified Android Engineer | ✍🏻 Writer |🧘🏻‍♂️ Stoic',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.bold),
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
                        Expanded(
                            flex: 1,
                            child: Image.asset('images/kotlin.png',
                                width: 100, height: 100)),
                        Expanded(
                            flex: 1,
                            child: Image.asset('images/firebase.png',
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
                            .headline4
                            .copyWith(color: Colors.blue, height: 1.1,  decoration: TextDecoration.underline),
                      ),
                    ),
                    Text(
                      'I build apps.\nI can make your app idea a reality.\n',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
                      textScaleFactor: 3,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: SelectableText(
                          'My expertise is in Android and iOS mobile app development. I can build cross-platform apps for Android and iOS using Flutter and native apps for Android using Java/Kotlin and the Android SDK.\n\nI have built complete Flutter and Android apps from scratch and published them to the Google Play Store and the Apple App Store.\n\nThe primary technologies I use are the Flutter SDK, Android SDK, Java, Dart, Kotlin, and Firebase.\n\nI have experience using Firebase Cloud Firestore, Firebase Authentication, Firebase Cloud Messaging, Firebase Cloud Functions, MVVM Architecture, Authentication with Google and Apple, Android Architecture Components, Provider Pattern for Flutter, Live Data and Observer Pattern for Android, CI/CD Pipeline Integration, Database Design and Implementation, UI Design, and Material Design.',
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
                            .headline4
                            .copyWith(color: Colors.blue, height: 1.1,  decoration: TextDecoration.underline),
                      ),
                    ),
                    Text(
                      'I am a Google Certified Developer.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
                      textScaleFactor: 3,
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
                      child: SelectableText(
                        'I earned an Associate Android Developer certification from the Google Developers Team, a course to help developers master core Android development skills and become competent Android engineers. \n\nBy the end of the course, I created over 30 bite-sized Android applications, created an Android game, mastered core Android development and mobile development best practices, and became 1 of 155 Google Certified Android Engineers in North America.',
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
                        'Writing ✍',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.blue, height: 1.1, decoration: TextDecoration.underline),
                      ),
                    ),
                    Text(
                      'I am a thought leader.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
                      textScaleFactor: 3,
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
                      child: SelectableText(
                          'I love learning, writing technical posts, and educating others on Flutter, Android, and Firebase. My articles have been published in multiple publications, including “Firebase Developers”, the official publication of Firebase run by the Google Firebase team, "Flutter Developers, and "Android Pub."',
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
                            .headline4
                            .copyWith(color: Colors.blue, height: 1.1,  decoration: TextDecoration.underline),
                      ),
                    ),
                    Text(
                      'I understand startups.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
                      textScaleFactor: 3,
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
                      child: SelectableText(
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
                    Text('Connect with me:', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black),),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              hoverColor: kPrimaryColor200,
                              icon: Image.asset('images/gmail_icon.png', width: 40, height: 40,),
                              onPressed: () => html.window.open(
                                  'mailto:ashtonjonesdev@gmail.com',
                                  'ashtonjonesdev'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              hoverColor: kPrimaryColor200,
                              icon: Image.asset('images/linkedin.png',
                                  width: 40, height: 40),
                              onPressed: () => html.window.open(
                                  'https://www.linkedin.com/in/tjgrapes/',
                                  'Ashton Jones'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              hoverColor: kPrimaryColor200,
                              icon: Image.asset('images/google_play_icon.png',
                                  width: 40, height: 40),
                              onPressed: () => html.window.open(
                                  'https://play.google.com/store/apps/dev?id=8786079395794167171',
                                  'Ashton Jones Google Play Developer Page'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              hoverColor: kPrimaryColor200,
                              icon: Image.asset('images/medium_icon.jpg',
                                  width: 40, height: 40),
                              onPressed: () => html.window.open(
                                  'https://medium.com/@TJgrapes', 'TJgrapes'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              hoverColor: kPrimaryColor200,
                              icon: Image.asset(
                                'images/github.png',
                                height: 40,
                                width: 40,
                              ),
                              onPressed: () => html.window.open(
                                  'https://github.com/ashtonjonesdev',
                                  'ashtonjonesdev'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              hoverColor: kPrimaryColor200,
                              icon: Image.asset(
                                'images/dev.to_logo.png',
                                height: 40,
                                width: 40,
                              ),
                              onPressed: () => html.window
                                  .open('https://dev.to/tjgrapes', 'dev.to'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              hoverColor: kPrimaryColor200,
                              icon: Image.asset(
                                'images/twitter.png',
                                width: 40,
                                height: 40,
                              ),
                              onPressed: () => html.window.open(
                                  'https://twitter.com/TJgrapes', 'TJgrapes'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              hoverColor: kPrimaryColor200,
                              icon: Image.asset(
                                'images/facebook.png',
                                width: 40,
                                height: 40,
                              ),
                              onPressed: () => html.window.open(
                                  'https://www.facebook.com/TJgrapes',
                                  'TJgrapes'),
                            ),
                          ),
                        ],
                      ),
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
