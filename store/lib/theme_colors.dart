import 'package:flutter/material.dart';

final ThemeData TribeThemeData = new ThemeData(
  brightness: Brightness.light,
  primaryColorBrightness: Brightness.light,
  accentColor: TribeColors.black[500],
  accentColorBrightness: Brightness.light
);

class TribeColors {
  TribeColors._(); // this basically makes it so you can instantiate this class

 static const _blackPrimaryValue = 0xFF000000;

  static const MaterialColor black = const MaterialColor(
    _blackPrimaryValue,
    const <int, Color>{
      50:  const Color(0xFFe0e0e0),
      100: const Color(0xFFb3b3b3),
      200: const Color(0xFF808080),
      300: const Color(0xFF4d4d4d),
      400: const Color(0xFF262626),
      500: const Color(_blackPrimaryValue),
      600: const Color(0xFF000000),
      700: const Color(0xFF000000),
      800: const Color(0xFF000000),
      900: const Color(0xFF000000),
    },
  );
}