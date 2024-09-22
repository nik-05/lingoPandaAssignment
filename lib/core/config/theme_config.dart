import 'package:flutter/material.dart';

class ThemeConfig {
  // Checking for dark theme. Default is false
  static bool isDark = false;

  // constant Colors, for both themes and custom Colors
  static const Color primary = Color(0XFF0C54BE);
  static const Color secondary = Color(0XFF303F60);
  static const Color onPrimary = Color(0XFFF5F9FD);
  static const Color onSecondary = Color(0XFFCED3DC);
  static const Color bodySmallText = Colors.black;

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
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      hintStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 21/14,
        color: bodySmallText,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: secondary,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
    ),

    // below are the textThemes.
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 21/14,
        color: bodySmallText,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 24/16,
      ),
      labelMedium: TextStyle(),
    ),
  );
}