import 'package:flutter/material.dart';
class PeahTheme {
  static textStyle({
      String fontFamily= 'Bellefair',
      double fontSize=14,
      TextOverflow overflow=TextOverflow.ellipsis,
      Color color=Colors.black,
      FontStyle fontStyle=FontStyle.normal,
      TextDecoration textDecoration=TextDecoration.none,
      FontWeight fontWeight=FontWeight.normal,
    }) => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    overflow: overflow,
    color: color,
    fontStyle: fontStyle,
    decoration: textDecoration,
    fontWeight: fontWeight
  );
  // color collection
  static Color continueWait = const Color.fromRGBO(172, 172, 172, 1);
  static Color continueReady = const Color.fromRGBO(0, 0, 0, 1);
}