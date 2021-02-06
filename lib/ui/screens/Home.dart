import 'package:ashton_jones_dev_website/core/utils/ScreenSize.dart';
import 'package:ashton_jones_dev_website/styles/colors.dart';
import 'package:ashton_jones_dev_website/ui/widgets/about_tab.dart';
import 'package:ashton_jones_dev_website/ui/widgets/consulting_tab.dart';
import 'package:ashton_jones_dev_website/ui/widgets/projects_tab.dart';
import 'package:ashton_jones_dev_website/ui/widgets/thoughts_tab.dart';
import 'package:ashton_jones_dev_website/ui/widgets/type_writer_text.dart';
import 'package:ashton_jones_dev_website/ui/widgets/ventures_tab.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:universal_platform/universal_platform.dart';
import 'dart:html' as html;

import '../widgets/fun_tab.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _appBarTitle = 'About';

  String _typeWriterText = 'I create experiences';

  bool _socialLinkTextVisibility = true;

  static List<Widget> _bodyWidgets = <Widget>[
    AboutTab(),
    ThoughtsTab(),
    VenturesTab(),
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
            child: Scrollbar(
              thickness: 5,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            hoverColor: kPrimaryColorLight,
                              splashRadius: 24,
                              icon: Icon(Icons.clear, size: 24,),
                              onPressed: () => Navigator.pop(context)),
                        )),
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
                          html.window.open(
                              'https://medium.com/the-ascent/i-did-not-start-living-until-25-2061b1bf1c20',
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
                          _appBarTitle = 'About';
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
                          _appBarTitle = 'Thoughts';
                        });
                        Navigator.pop(context);
                      },
                    ),
                    FlatButton.icon(
                      hoverColor: kPrimaryColor200,
                      icon: Icon(Icons.alt_route_outlined),
                      label: Text('Ventures',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Colors.black),
                          overflow: TextOverflow.visible,
                          softWrap: false),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 2;
                          _appBarTitle = 'Ventures';
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
                          _selectedIndex = 3;
                          _appBarTitle = 'Projects';
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
                          _selectedIndex = 4;
                          _appBarTitle = 'Consulting';
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
                          _selectedIndex = 5;
                          _appBarTitle = 'Fun';
                        });
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      height: 10,
                      color: kPrimaryColorLight,
                      thickness: 5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'images/medium_outro_image.png',
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Connect with me :]',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
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
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
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
          style: Theme.of(context).textTheme.headline6,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.waves_rounded,
            color: Colors.black,
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
      body: Scrollbar(
        thickness: 5,
        child: _bodyWidgets.elementAt(_selectedIndex),
      ),
    );
  }

  bool typewriter(double width) => width > 15;
}
