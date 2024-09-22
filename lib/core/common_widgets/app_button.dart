import 'package:flutter/material.dart';
import 'package:lingo_panda_assignment/core/config/theme_config.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // disable the on press when loading.
      onPressed: isLoading ? null : onPressed,
      child: isLoading ? CircularProgressIndicator(
        color: Theme.of(context).colorScheme.onPrimary,
      ) : Text(
        text,
        style:
            Theme.of(context).elevatedButtonTheme.style?.textStyle?.resolve({}),
      ),
    );
  }
}
