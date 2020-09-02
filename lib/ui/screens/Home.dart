import 'package:ashton_jones_dev_website/ui/widgets/about_tab.dart';
import 'package:ashton_jones_dev_website/ui/widgets/consulting_tab.dart';
import 'package:ashton_jones_dev_website/ui/widgets/projects_tab.dart';
import 'package:ashton_jones_dev_website/ui/widgets/thoughts_tab.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../widgets/fun_tab.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _appBarTitle = '👨🏻‍💻';

  static List<Widget> tabWidgets = <Widget>[
    AboutTab(),
    ThoughtsTab(),
    ProjectsTab(),
    ConsultingTab(),
    FunTab()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$_appBarTitle',
          textScaleFactor: 2,
        ),
        centerTitle: true,
        toolbarHeight: 48.0,
        backgroundColor: Colors.white,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.mail),
            label: Text('Contact me', style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.black),
                overflow: TextOverflow.visible, softWrap: false),
            onPressed: () => html.window
                .open('mailto:ashtonjonesdev@gmail.com', 'ashtonjonesdev'),
          ),
        ],
      ),
      body: Center(
        child: tabWidgets.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 48,
        child: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 10,
          iconSize: 20,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('About'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chrome_reader_mode),
              title: Text('Thoughts'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mobile_screen_share),
              title: Text('Projects'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.build), title: Text('Consulting')),
            BottomNavigationBarItem(icon: Icon(Icons.mood), title: Text('Fun')),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              switch (index) {
                case 0:
                  _appBarTitle = '👨🏻‍💻';
                  break;
                case 1:
                  _appBarTitle = '✍🏼';
                  break;
                case 2:
                  _appBarTitle = '📱';
                  break;
                case 3:
                  _appBarTitle = '🛠';
                  break;
                case 4:
                  _appBarTitle = '🕹';
                  break;
                default:
                  break;
              }
            });
          },
          showUnselectedLabels: true,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Theme.of(context).disabledColor,
        ),
      ),
    );
  }
}
