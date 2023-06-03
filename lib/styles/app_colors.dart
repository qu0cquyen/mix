import 'package:flutter/material.dart';

class AppColors {
  static final Map<String, MaterialColor> _colors = {};

  /// Your custom color goes here
  static void addColor(
      {required String colorName, required MaterialColor color}) {
    _colors.putIfAbsent(colorName, () => color);
  }

  /// Predefine set of colors
  static MaterialColor primaryColor =
      const MaterialColor(0xFF018382, <int, Color>{
    50: Color(0xFFE6F3F3),
    100: Color(0xFFCCE6E6),
    200: Color(0xFFB3DADA),
    300: Color(0xFF99CDCD),
    400: Color(0xFF80C1C1),
    500: Color(0xFF67B5B4),
    600: Color(0xFF4DA8A8),
    700: Color(0xFF349C9B),
    800: Color(0xFF1A8F8F),
    900: Color(0xFF018382),
  });

  static MaterialColor secondaryColor =
      const MaterialColor(0xFFACA9A9, <int, Color>{
    50: Color(0xFFF7F6F6),
    100: Color(0xFFEEEEEE),
    200: Color(0xFFE6E5E5),
    300: Color(0xFFDEDDDD),
    400: Color(0xFFD6D4D4),
    500: Color(0xFFCDCBCB),
    600: Color(0xFFC5C3C3),
    700: Color(0xFFBDBABA),
    800: Color(0xFFB4B2B2),
    900: Color(0xFFACA9A9),
  });

  static MaterialColor supportColor =
      const MaterialColor(0xFF605657, <int, Color>{
    100: Color(0xFFEEECEC),
    200: Color(0xFFCCC5C6),
    300: Color(0xFFA99F9F),
    400: Color(0xFF877879),
    500: Color(0xFF605657),
    600: Color(0xFF3A3334),
  });

  static MaterialColor positiveColor =
      const MaterialColor(0xFF32CD32, <int, Color>{
    50: Color(0xFFEBFAEB),
    100: Color(0xFFD6F5D6),
    200: Color(0xFFC2F0C2),
    300: Color(0xFFADEBAD),
    400: Color(0xFF99E699),
    500: Color(0xFF84E184),
    600: Color(0xFF70DC70),
    700: Color(0xFF5BD75B),
    800: Color(0xFF47D247),
    900: Color(0xFF32CD32),
  });

  static MaterialColor errorColor =
      const MaterialColor(0xFF9D6562, <int, Color>{
    50: Color(0xFFF5F0EF),
    100: Color(0xFFEBE0E0),
    200: Color(0xFFE2D1D0),
    300: Color(0xFFD8C1C0),
    400: Color(0xFFCEB2B1),
    500: Color(0xFFC4A3A1),
    600: Color(0xFFBA9391),
    700: Color(0xFFB18481),
    800: Color(0xFFA77472),
    900: Color(0xFF9D6562),
  });

  static Color textColor = const Color(0xFF595959);

  /// Get added Custom Colors
  Map<String, MaterialColor> get colors => _colors;
}
