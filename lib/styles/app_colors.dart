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
      const MaterialColor(0xFF116A7B, <int, Color>{
    50: Color(0xFFCFE1E5),
    100: Color(0xFF70A6B0),
    200: Color(0xFF5897A3),
    300: Color(0xFF418895),
    400: Color(0xFF297988),
    500: Color(0xFF116A7B),
    600: Color(0xFF0F5F6F),
    700: Color(0xFF0E5562),
    800: Color(0xFF0C4A56),
    900: Color(0xFF0A404A),
  });

  static MaterialColor secondaryColor =
      const MaterialColor(0xFFCDC2AE, <int, Color>{
    50: Color(0xFFF5F3EF),
    100: Color(0xFFE1DACE),
    200: Color(0xFFDCD4C6),
    300: Color(0xFFD7CEBE),
    400: Color(0xFFD2C8B6),
    500: Color(0xFFCDC2AE),
    600: Color(0xFFB9AF9D),
    700: Color(0xFFA49B8B),
    800: Color(0xFF90887A),
    900: Color(0xFF7B7468),
  });

  static MaterialColor supportColor =
      const MaterialColor(0xFFECE5C7, <int, Color>{
    50: Color(0xFFFBFAF4),
    100: Color(0xFFF4EFDD),
    200: Color(0xFFF2EDD8),
    300: Color(0xFFF0EAD2),
    400: Color(0xFFEEE8CD),
    500: Color(0xFFECE5C7),
    600: Color(0xFFD4CEB3),
    700: Color(0xFFBDB79F),
    800: Color(0xFFA5A08B),
    900: Color(0xFF8E8977),
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

  static MaterialColor backgroundColor =
      const MaterialColor(0xFFC2DEDC, <int, Color>{
    50: Color(0xFFF3F8F8),
    100: Color(0xFFDAEBEA),
    200: Color(0xFFD4E8E7),
    300: Color(0xFFCEE5E3),
    400: Color(0xFFC8E1E0),
    500: Color(0xFFC2DEDC),
    600: Color(0xFFAFC8C6),
    700: Color(0xFF9BB2B0),
    800: Color(0xFF889B9A),
    900: Color(0xFF748584),
  });

  static Color textColor = const Color(0xFF595959);

  /// Get added Custom Colors
  Map<String, MaterialColor> get colors => _colors;
}
