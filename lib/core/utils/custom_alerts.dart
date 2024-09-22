import 'package:flutter/material.dart';

class CustomAlerts {
  static void showToastMessage() {}

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
