import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isObscureText;
  final TextInputType keyboardType;

  const AppTextField({
    super.key,
    required this.controller,
    this.isObscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.isObscureText,
      decoration: InputDecoration(
      ),
    );
  }
}
