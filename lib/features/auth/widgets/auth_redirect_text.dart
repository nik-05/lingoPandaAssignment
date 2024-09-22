import 'package:flutter/material.dart';

class AuthRedirectText extends StatelessWidget {
  final VoidCallback onTap;
  final String text1;
  final String text2;

  const AuthRedirectText({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
          text: TextSpan(
              text: text1,
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
            TextSpan(
              text: text2,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ])),
    );
  }
}
