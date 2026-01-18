import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.title});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
      title: title,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
