import 'package:flutter/material.dart';
// FontWeight.w100: Thin
// FontWeight.w200: Extra Light
// FontWeight.w300: Light
// FontWeight.w400: Regular
// FontWeight.w500: Medium
// FontWeight.w600: Semi-Bold
// FontWeight.w700: Bold
// FontWeight.w800: Extra Bold
// FontWeight.w900: Ultra Bold

class AppFonts {
  static const String fontFamily = 'Roboto';

  static const TextStyle regular = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle medium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle bold = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
  );
  // Add more styles as needed
}
