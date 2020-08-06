import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {

  static ThemeData appThemeDataLight = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kPrimaryColor,
    primaryColorLight: kPrimaryColorLight,
    accentColor: kAccentColor,
    backgroundColor: kBackgroundColor,
    errorColor: kErrorColor,
    textTheme: TextTheme(
        headline1: TextStyle(fontSize: 96.0, fontFamily: 'GoogleSansRegular', color: kTextColor),
        headline2: TextStyle(fontSize: 60.0, fontFamily: 'GoogleSansRegular', color: kTextColor),
        headline3: TextStyle(fontSize: 48.0, fontFamily: 'GoogleSansRegular', color: kTextColor),
        headline4: TextStyle(fontSize: 34.0, fontFamily: 'GoogleSansRegular', color: kTextColor),
        headline5: TextStyle(fontSize: 24.0, fontFamily: 'GoogleSansRegular', color: kTextColor),
        headline6: TextStyle(fontSize: 20.0, fontFamily: 'GoogleSansRegular', color: kTextColor),
        bodyText1: TextStyle(fontSize: 16.0, fontFamily: 'GoogleSansRegular', color: kTextColor),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'GoogleSansRegular', color: kTextColor),
        button: TextStyle(fontSize: 14.0, fontFamily: 'GoogleSansRegular', color: kTextColor),
        caption: TextStyle(fontSize: 12.0, fontFamily: 'GoogleSansRegular', color: kTextColor),
        overline: TextStyle(fontSize: 10.0, fontFamily: 'GoogleSansRegular', color: kTextColor)),
  );

}