import 'package:flutter/material.dart';

enum AppThemes {
  lightTheme,
  darkTheme,
  greenTheme,
}

Map<dynamic, ThemeData> appThemeData = {
  AppThemes.lightTheme: ThemeData.light(),
  AppThemes.darkTheme: ThemeData.dark(),
  AppThemes.greenTheme: ThemeData(scaffoldBackgroundColor: Colors.green)
};
