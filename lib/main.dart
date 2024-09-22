import 'package:flutter/material.dart';
import 'package:lingo_panda_assignment/core/config/theme_config.dart';
import 'package:lingo_panda_assignment/features/auth/screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LingoPanda Assignment',
      // Using the light theme as default
      // There is no dark theme in the app, so we can use the light theme directly
      theme: ThemeConfig.lightTheme,
      // Removing the debug banner because it's a sore to the eyes
      debugShowCheckedModeBanner: false,
      // Since there are no toggle buttons to switch theme, we can use the ThemeMode directly
      // in future if we want to add toggle button -> Use Provider with ChangeAppNotifier to change the theme
      themeMode: ThemeConfig.isDark ? ThemeMode.dark : ThemeMode.light,
      // By default Screen is signup screen.
      home: const SignUpScreen(),
    );
  }
}