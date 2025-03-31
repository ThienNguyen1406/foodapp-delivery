import 'package:flutter/material.dart';

class AppFonts {
  static const String Gilroy = 'lib/res/theme/fonts/Gilroy-Black.ttf';
  static const String Gilroy_Medium = 'lib/res/theme/fonts/Gilroy-Medium.ttf';
  static const String Gilroy_Regular =
      'lib/res/theme/fonts/Gilroy-SemiBold.ttf';
  static const String Gilroy_Semibold =
      'lib/res/theme/fonts/Gilroy-SemiBold.ttf';
  static const String Gilroy_Bold = 'lib/res/theme/fonts/Gilroy-Bold.ttf';

  static TextStyle GilroyBasic(double fontSize, Color color) =>
      TextStyle(fontFamily: Gilroy, fontSize: fontSize, color: color);
  static TextStyle GilroyBasic600(double fontSize, Color color) => TextStyle(
      fontFamily: Gilroy,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w600);
  static TextStyle GilroyMedium(double fontSize, Color color) =>
      TextStyle(fontFamily: Gilroy_Medium, fontSize: fontSize, color: color);
  static TextStyle GilroyMedium400(double fontSize, Color color) => TextStyle(
      fontFamily: Gilroy_Medium,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w400);
  static TextStyle GilroyRegular(double fontSize, Color color) =>
      TextStyle(fontFamily: Gilroy_Regular, fontSize: fontSize, color: color);
  static TextStyle GilroySemiBold400(double fontSize, Color color) => TextStyle(
      fontFamily: Gilroy_Semibold,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w400);
  static TextStyle GilroyBold400(double fontSize, Color color) => TextStyle(
      fontFamily: Gilroy_Bold,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w400);
}
