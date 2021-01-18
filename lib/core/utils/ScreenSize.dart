import 'package:flutter/material.dart';


// Utility class to get screen size
class ScreenSize {


  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 900;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }

}