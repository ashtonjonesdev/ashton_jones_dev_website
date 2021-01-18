import 'package:ashton_jones_dev_website/core/utils/ScreenSize.dart';
import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:ashton_jones_dev_website/ui/widgets/about_tab.dart';
import 'package:ashton_jones_dev_website/ui/widgets/consulting_tab.dart';
import 'package:ashton_jones_dev_website/ui/widgets/projects_tab.dart';
import 'package:ashton_jones_dev_website/ui/widgets/thoughts_tab.dart';
import 'package:ashton_jones_dev_website/ui/widgets/type_writer_text.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'dart:html' as html;

import '../widgets/fun_tab.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _appBarTitle = '👨🏻‍💻';

  String _typeWriterText = 'I create experiences';

  static List<Widget> _bodyWidgets = <Widget>[
    AboutTab(),
    ThoughtsTab(),
    ProjectsTab(),
    ConsultingTab(),
    FunTab()
  ];

  int _selectedIndex = 0;

  void openNavigationDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(alignment: Alignment.topRight,child: IconButton(splashRadius: 16,icon: Icon(Icons.clear), onPressed: () => Navigator.pop(context))),
                  SizedBox(
                    height: 20,
                  ),
                  PlayAnimation<double>(
                    duration: 400.milliseconds,
                    tween: 0.0.tweenTo(80.0),
                    builder: (context, child, height) {
                      return PlayAnimation<double>(
                        duration: 1600.milliseconds,
                        delay: 500.milliseconds,
                        tween: 2.0.tweenTo(300.0),
                        builder: (context, child, width) {
                          return Container(
                            decoration: BoxDecoration(
                                color: kPrimaryColorLight,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(50),
                                      blurRadius: 15,
                                      offset: Offset(0, 8),
                                      spreadRadius: 5)
                                ]),
                            width: width,
                            height: height,
                            child: typewriter(width)
                                ? TypeWriterText(_typeWriterText)
                                : Container(),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton.icon(
                      hoverColor: kPrimaryColor200,
                      icon: Icon(Icons.article_rounded),
                      label: Text('My Story',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.black),
                          overflow: TextOverflow.visible,
                          softWrap: false),
                      onPressed: () {
                        html.window.open('https://medium.com/the-ascent/i-did-not-start-living-until-25-2061b1bf1c20',
                            'Ashton Jones\' Story');
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton.icon(
                    hoverColor: kPrimaryColor200,
                    icon: Icon(Icons.account_circle),
                    label: Text('About',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.black),
                        overflow: TextOverflow.visible,
                        softWrap: false),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                        _appBarTitle = '👨🏻‍💻';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton.icon(
                    hoverColor: kPrimaryColor200,
                    icon: Icon(Icons.chrome_reader_mode),
                    label: Text('Thoughts',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.black),
                        overflow: TextOverflow.visible,
                        softWrap: false),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                        _appBarTitle = '✍🏼';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton.icon(
                    hoverColor: kPrimaryColor200,
                    icon: Icon(Icons.code),
                    label: Text('Projects',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.black),
                        overflow: TextOverflow.visible,
                        softWrap: false),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                        _appBarTitle = '📱';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton.icon(
                    hoverColor: kPrimaryColor200,
                    icon: Icon(Icons.build),
                    label: Text('Consulting',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.black),
                        overflow: TextOverflow.visible,
                        softWrap: false),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 3;
                        _appBarTitle = '🛠';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton.icon(
                    hoverColor: kPrimaryColor200,
                    icon: Icon(Icons.mood),
                    label: Text('Fun',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.black),
                        overflow: TextOverflow.visible,
                        softWrap: false),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 4;
                        _appBarTitle = '🕹';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 30,),
                  Divider(
                    height: 10,
                    color: kPrimaryColorLight,
                    thickness: 5,
                  ),
                  SizedBox(height: 30,),
                  Image.asset('images/medium_outro_image.png', fit: BoxFit.contain,),
                  SizedBox(height: 20,),
                  Text('Connect with me:', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black),),
                  SizedBox(height: 10,),
                  !ScreenSize.isSmallScreen(context) ? Flexible(
                    fit: FlexFit.loose,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: FlatButton.icon(
                            hoverColor: kPrimaryColor200,
                            icon: Image.asset('images/gmail_icon.png', width: 20, height: 20,),
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
                            hoverColor: kPrimaryColor200,
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
                            hoverColor: kPrimaryColor200,
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
                            hoverColor: kPrimaryColor200,
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
                            hoverColor: kPrimaryColor200,
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
                            hoverColor: kPrimaryColor200,
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
                            hoverColor: kPrimaryColor200,
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
                            hoverColor: kPrimaryColor200,
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
                  ) :
                  Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: FlatButton.icon(
                                  hoverColor: kPrimaryColor200,
                                  icon: Image.asset('images/gmail_icon.png', width: 20, height: 20,),
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
                                  hoverColor: kPrimaryColor200,
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
                                  hoverColor: kPrimaryColor200,
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
                                  hoverColor: kPrimaryColor200,
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
                        ),
                        SizedBox(height: 10,),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: FlatButton.icon(
                                  hoverColor: kPrimaryColor200,
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
                                  hoverColor: kPrimaryColor200,
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
                                  hoverColor: kPrimaryColor200,
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
                                  hoverColor: kPrimaryColor200,
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
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$_appBarTitle',
          textScaleFactor: 1.75,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.waves_rounded,
            color: kPrimaryColor,
          ),
          onPressed: openNavigationDialog,
        ),
        centerTitle: true,
        toolbarHeight: 48.0,
        backgroundColor: Colors.white,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.mail),
            label: Text('Contact me',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.black),
                overflow: TextOverflow.visible,
                softWrap: false),
            onPressed: () => html.window.open(
                'mailto:ashtonjonesdev@gmail.com?subject=Hi%20Ashton!',
                'ashtonjonesdev'),
          ),
        ],
      ),
      body: Center(
        widthFactor: 1,
        heightFactor: 1,
        child: _bodyWidgets.elementAt(_selectedIndex),
      ),
    );
  }

  bool typewriter(double width) => width > 15;
}
