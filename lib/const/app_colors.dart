import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColorTheme(bool isDark) =>
      isDark ? Color(0xFF3e4161) : Color(0xFFf4f4f6);
  static Color textColorTheme(bool isDark) =>
      isDark ? Colors.white : Colors.black;
  static Color subTextColor(bool isDark) =>
      isDark ? Colors.white60 : Colors.black54;
  static final Color textColor = Colors.white;
  static final Color textBlue = Colors.blue[900];
  static final Color grey = Colors.grey[400];
  static final Color darkAccentColor = Colors.black;
  static final Color bgColorChoosed = Color(0xFF2020d7);
}
