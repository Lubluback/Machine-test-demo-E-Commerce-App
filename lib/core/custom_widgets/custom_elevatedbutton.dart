//import 'dart:ffi';

import 'package:e_commerce_app_demo/core/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomElevatedbutton extends StatelessWidget {
  const CustomElevatedbutton({
    super.key,
    required this.text,
    required this.color,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.backgroundColor,
    required this.borderRadius,
    required this.fontsize,
    required this.fontWeight,
  });
  final String text;
  final Color color;
  final double width;
  final double height;
  final Color backgroundColor;
  final void Function()? onPressed;
  final double borderRadius;
  final double fontsize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: Color(0xff4F7B39),
        minimumSize: Size(width, height),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: CustomText(
        text: text,
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
  }
}
