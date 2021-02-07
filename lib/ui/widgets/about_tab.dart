import 'package:ashton_jones_dev_website/core/utils/ScreenSize.dart';
import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [kPrimaryColorLight, kPrimaryColorDark])),
              child: Text(
                'Ashton Jones',
                textAlign: TextAlign.center,
                textScaleFactor: 6,
                style: GoogleFonts.aldrich()
                    .copyWith(letterSpacing: 3, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Google Certified Android Engineer | Writer | Stoic',
              style: Theme.of(context).textTheme.bodyText1,
              textScaleFactor: 3,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
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
            Image.network('https://firebasestorage.googleapis.com/v0/b/ashton-jones-dev-assets.appspot.com/o/androidify.gif?alt=media&token=b15c687d-841b-40d8-b2da-8ef22537eb12'),
            Divider(
              height: 40,
              thickness: 5,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '🖥',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.black),
            ),
            Text(
              'I build apps',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.bold, color: kPrimaryColor),
              textScaleFactor: 3,
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 250,
              runSpacing: 100,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '3',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(color: kPrimaryColor),
                    ),
                    Text(
                      'Apps launched 🚀',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: kPrimaryColorLight),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '7+',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(color: kPrimaryColor),
                    ),
                    Text(
                      'Apps developed 🛠',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: kPrimaryColorLight),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Wrap(
              runAlignment: WrapAlignment.spaceEvenly,
              spacing: 200,
              runSpacing: 100,
              children: [
                Column(
                  children: [
                    Text('_Reply', style: Theme.of(context).textTheme.headline3.copyWith(color: kPrimaryColorLight),),
                    Image.asset('images/reply_app_icon.png'),
                    Image.asset('images/_replyDemo.gif'),
                    InkWell(
                      onTap: () {
                        html.window.open(
                            'https://play.google.com/store/apps/details?id=dev.ashtonjones.reply_flutter',
                            'GooglePlayStoreLink');
                      },
                      child: Image.asset('images/google_play_store_badge.png',
                          width: 200, height: 100),
                    ),
                    InkWell(
                      onTap: () {
                        html.window.open(
                            'https://apps.apple.com/us/app/id1522893504',
                            'AppleAppStoreLink');
                      },
                      child: Image.asset('images/apple_app_store.png',
                          width: 200, height: 100),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Torch', style: Theme.of(context).textTheme.headline3.copyWith(color: Color(0xFFF29E2E)),),
                    Image.asset('images/torch_app_icon_96.png'),
                    Image.network('https://firebasestorage.googleapis.com/v0/b/ashton-jones-dev-assets.appspot.com/o/torchdemo.gif?alt=media&token=9e207bdf-3cb6-4213-af28-df1f9768ae72'),
                    InkWell(
                      onTap: () {
                        html.window.open(
                            'https://play.google.com/store/apps/details?id=dev.ashtonjones.torch',
                            'GooglePlayStoreLink');
                      },
                      child: Image.asset('images/google_play_store_badge.png',
                          width: 200, height: 100),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Reply', style: Theme.of(context).textTheme.headline3.copyWith(color: kPrimaryColor),),
                    Image.asset('images/reply_app_icon.png'),
                    Image.asset('images/reply.gif'),
                    InkWell(
                      onTap: () {
                        html.window.open(
                            'https://play.google.com/store/apps/details?id=dev.ashtonjones.reply',
                            'GooglePlayStoreLink');
                      },
                      child: Image.asset('images/google_play_store_badge.png',
                          width: 200, height: 100),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              color: kPrimaryColorLight,
              onPressed: () {
                html.window.open('mailto:ashtonjonesdev@gmail.com',
                    'SendEmailToAshtonJones');
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Contact me for app development',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.white, fontSize: 32),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(32.0),
            //   child: SelectableText(
            //       'My expertise is in Android and iOS mobile app development. I can build cross-platform apps for Android and iOS using Flutter and native apps for Android using Java/Kotlin and the Android SDK.\n\nI have built complete Flutter and Android apps from scratch and published them to the Google Play Store and the Apple App Store.\n\nThe primary technologies I use are the Flutter SDK, Android SDK, Java, Dart, Kotlin, and Firebase.\n\nI have experience using Firebase Cloud Firestore, Firebase Authentication, Firebase Cloud Messaging, Firebase Cloud Functions, MVVM Architecture, Authentication with Google and Apple, Android Architecture Components, Provider Pattern for Flutter, Live Data and Observer Pattern for Android, CI/CD Pipeline Integration, Database Design and Implementation, UI Design, and Material Design.',
            //       style: Theme.of(context)
            //           .textTheme
            //           .bodyText2
            //           .copyWith(fontSize: 16)),
            // ),
            Divider(
              height: 40,
              thickness: 5,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '🔖',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.black),
            ),
            Text(
              'I am a Google Certified Developer',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.bold, color: kPrimaryColor),
              textScaleFactor: 3,
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              spacing: 100,
              runSpacing: 100,
              alignment: WrapAlignment.center,
              children: [
                Image.asset(
                  'images/associate_android_developer_badge.png',
                  width: 424,
                  height: 424,
                ),
                Image.asset(
                  'images/google_certification.png',
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              color: kPrimaryColorLight,
              onPressed: () {
                html.window.open('https://android.jlelse.eu/from-0-to-android-engineer-6f9019395b2a',
                    'OpenMediumArticle');
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Learn about how I became a Google Certified Developer',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.white, fontSize: 32),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 32),
            //   child: SelectableText(
            //     'I earned an Associate Android Developer certification from the Google Developers Team, a course to help developers master core Android development skills and become competent Android engineers. \n\nBy the end of the course, I created over 30 bite-sized Android applications, created an Android game, mastered core Android development and mobile development best practices, and became 1 of 155 Google Certified Android Engineers in North America.',
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyText2
            //         .copyWith(fontSize: 16),
            //   ),
            // ),
            Divider(
              height: 40,
              thickness: 5,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '🖋',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'I am a storyteller',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.bold, color: kPrimaryColor),
              textScaleFactor: 3,
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'images/Insight_Owl_black.png',
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              color: kPrimaryColorLight,
              onPressed: () {
                html.window.open('https://insightowl.substack.com/welcome',
                    'OpenSubstackPublication');
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Subscribe to my publication',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.white, fontSize: 32),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 32),
            //   child: SelectableText(
            //       'I love learning, writing technical posts, and educating others on Flutter, Android, and Firebase. My articles have been published in multiple publications, including “Firebase Developers”, the official publication of Firebase run by the Google Firebase team, "Flutter Developers, and "Android Pub."',
            //       style: Theme.of(context)
            //           .textTheme
            //           .bodyText2
            //           .copyWith(fontSize: 16)),
            // ),
            Divider(
              height: 40,
              thickness: 5,
            ),
            SizedBox(height: 30),
            Text(
              '🚀',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Colors.blue,
                  height: 1.1,
                  decoration: TextDecoration.underline),
            ),
            Text(
              'I understand startups',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.bold, color: kPrimaryColor),
              textScaleFactor: 3,
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'images/tech_day_me.png',
            ),
            SizedBox(height: 30),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              color: kPrimaryColorLight,
              onPressed: () {
                html.window.open('https://www.instagram.com/p/B9R3sfRFHy4/?igshid=1ntltciv11712', 'LaunchInstagramPost');
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Learn about my startup journey',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.white, fontSize: 32),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 32),
            //   child: SelectableText(
            //       'I have first hand experience building a startup and am a member of Domi Station. I am involved in the Tallahassee startup community, and a board member of Entrepreneurship Tallahassee, an organization which schedules Startup Week Tallahassee and promotes entrepreneurship.',
            //       style: Theme.of(context)
            //           .textTheme
            //           .bodyText2
            //           .copyWith(fontSize: 16)),
            // ),
            Divider(
              height: 40,
              thickness: 5,
            ),
            SizedBox(height: 30),
            Text(
              'Connect with me :]',
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: kPrimaryColorLight),
            ),
            SizedBox(
              height: 10,
            ),
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
                      icon: Image.asset(
                        'images/gmail_icon.png',
                        width: 60,
                        height: 60,
                      ),
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
                          width: 70, height: 70),
                      onPressed: () => html.window.open(
                          'https://www.linkedin.com/in/tjgrapes/',
                          'Ashton Jones'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      hoverColor: kPrimaryColor200,
                      icon: Image.asset('images/medium_icon.jpg',
                          width: 70, height: 70),
                      onPressed: () => html.window
                          .open('https://medium.com/@TJgrapes', 'TJgrapes'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      hoverColor: kPrimaryColor200,
                      icon: Image.asset(
                        'images/github.png',
                        height: 70,
                        width: 70,
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
                        'images/twitter.png',
                        width: 70,
                        height: 70,
                      ),
                      onPressed: () => html.window
                          .open('https://twitter.com/TJgrapes', 'TJgrapes'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      hoverColor: kPrimaryColor200,
                      icon: Image.asset(
                        'images/facebook.png',
                        width: 70,
                        height: 70,
                      ),
                      onPressed: () => html.window.open(
                          'https://www.facebook.com/TJgrapes', 'TJgrapes'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
//
//

//
