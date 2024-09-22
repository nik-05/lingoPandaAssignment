import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const CommentScreen());
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Comment Screen'),
      ),
    );
  }
}
