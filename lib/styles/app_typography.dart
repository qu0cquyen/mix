import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mix/styles/styles.dart';

class AppTypography {
  static TextStyle headline1 =
      _baseStyleGenerator(fontSize: 60, fontWeight: FontWeight.bold);
  static TextStyle headline2 =
      _baseStyleGenerator(fontSize: 40, fontWeight: FontWeight.bold);
  static TextStyle headline3 =
      _baseStyleGenerator(fontSize: 32, fontWeight: FontWeight.w400);
  static TextStyle headline4 =
      _baseStyleGenerator(fontSize: 25, fontWeight: FontWeight.w400);
  static TextStyle bodyText1 =
      _baseStyleGenerator(fontSize: 20, fontWeight: FontWeight.normal);
  static TextStyle bodyText2 =
      _baseStyleGenerator(fontSize: 16, fontWeight: FontWeight.normal);
  static TextStyle subText1 =
      _baseStyleGenerator(fontSize: 14, fontWeight: FontWeight.normal);
  static TextStyle subText2 =
      _baseStyleGenerator(fontSize: 10, fontWeight: FontWeight.normal);

  static double get fontSizeHeadline1 => 60.0;
  static double get fontSizeHeadline2 => 40.0;
  static double get fontSizeHeadline3 => 32.0;
  static double get fontSizeHeadline4 => 25.0;
  static double get fontSizeBodyText1 => 20.0;
  static double get fontSizeBodyText2 => 16.0;
  static double get fontSizeSubText1 => 14.0;
  static double get fontSizeSubText2 => 10.0;
}

TextStyle _baseStyleGenerator(
    {required double fontSize, required FontWeight fontWeight}) {
  return GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: AppColors.textColor,
    ),
  );
}
