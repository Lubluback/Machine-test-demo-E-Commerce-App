import 'package:flutter/material.dart';

class SnackbarUtil {
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.black,
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
          duration: duration,
        ),
      );
  }
}
