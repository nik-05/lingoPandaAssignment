import 'package:flutter/material.dart';

class ThemeConfig {
  // Checking for dark theme. Default is false
  static bool isDark = false;

  // constant Colors, for both themes and custom Colors
  static const Color primary = Color(0XFF0C54BE);
  static const Color secondary = Color(0XFF303F60);
  static const Color onPrimary = Color(0XFFF5F9FD);
  static const Color onSecondary = Color(0XFFCED3DC);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: primary,
      titleTextStyle: TextStyle(
        color: onPrimary,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 21/14,
        fontFamily: 'Poppins',
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: secondary,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
    ),
  );
}