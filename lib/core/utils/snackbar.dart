import 'package:e_commerce_app_demo/core/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SnackbarUtil {
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: CustomText(
            text: message,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          backgroundColor: backgroundColor,
          duration: duration,
        ),
      );
  }
}
