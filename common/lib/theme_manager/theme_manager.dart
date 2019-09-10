import 'dart:async';
import 'package:flutter/material.dart';

class ThemeManager {
  int _currentTheme = 0;

  StreamController<ThemeData> _themeController = StreamController<ThemeData>();
  List<ThemeData> _availableThemes = [
    ThemeData(backgroundColor: Colors.red, accentColor: Colors.blue),
    ThemeData(backgroundColor: Colors.green, accentColor: Colors.yellow),
    ThemeData(backgroundColor: Colors.purple, accentColor: Colors.pink),
    ThemeData(backgroundColor: Colors.blue, accentColor: Colors.red),
  ];
  Stream<ThemeData> get theme => _themeController.stream;

  Future _updateStatusBarColor(ThemeData themeToApply) async {
    // Set status bar color
    // await FlutterStatusbarcolor.setStatusBarColor(themeToApply.accentColor);
    // // Check the constrast between the colors and set the status bar icons colors to white or dark
    // if (useWhiteForeground(themeToApply.accentColor)) {
    //   FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    // } else {
    //   FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    // }
  }

  Future changeTheme() async {
    _currentTheme++;
    if (_currentTheme >= _availableThemes.length) {
      _currentTheme = 0;
    }
    // Get the theme to apply
    var themeToApply = _availableThemes[_currentTheme];
    // Update status bar color
    await _updateStatusBarColor(themeToApply);
    // Broadcast new theme
    _themeController.add(themeToApply);
  }
}
