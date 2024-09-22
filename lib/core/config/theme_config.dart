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
  static const Color buttonText = Colors.white;

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: onPrimary,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: primary,
      titleTextStyle: appBarTextStyle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: const Size(231, 49),
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: buttonText,
          height: 24 / 16,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: inputBorder,
      enabledBorder: inputBorder,
      hintStyle: bodySmall,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: secondary,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
    ),

    // below are the textThemes.
    textTheme: TextTheme(
      bodySmall: bodySmall,
      bodyMedium: bodyMedium,
      titleMedium: titleMedium,
      titleLarge: titleLarge,
    ),
  );


  // Border Themes...
  static OutlineInputBorder inputBorder =  const OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.all(Radius.circular(10)),
  );


  // Text Themes
  static TextStyle bodySmall = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 21 / 14,
    color: bodySmallText,
  );

  static TextStyle bodyMedium = const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: bodySmallText,
    height: 24 / 16,
  );

  static TextStyle titleMedium = const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: primary,
    height: 24 / 16,
  );

  static TextStyle titleLarge = const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: primary,
    height: 30 / 16,
  );

  static TextStyle appBarTextStyle = const TextStyle(
    color: onPrimary,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 21 / 14,
    fontFamily: 'Poppins',
  );
}
