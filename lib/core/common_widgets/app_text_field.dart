import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isObscureText;
  final TextInputType keyboardType;
  final String? hintText;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.controller,
    this.isObscureText = false,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.validator,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  /// [obscureText] will change the visibility of the password icon
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.isObscureText;
    super.initState();
  }

  // Will toggle the obscureText value
  void passwordIconOnTapFunction() {
    setState(() => obscureText = !obscureText);
  }

  // if textField is not obscured then will show nothing, else will show icons accordingly
  Widget? get passwordIcon =>
      widget.isObscureText ? null : GestureDetector(
        onTap: passwordIconOnTapFunction,
        child: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: obscureText,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: passwordIcon,
      ),
    );
  }
}
