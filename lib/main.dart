import 'package:ashton_jones_dev_website/ui/screens/Home.dart';
import 'package:ashton_jones_dev_website/styles/theme.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: 'Ashton Jones',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appThemeDataLight,
    );
  }

}


