import 'package:e_commerce_app_demo/core/local_db.dart/shared_pref.dart';
import 'package:e_commerce_app_demo/feature/auth/signup/model/model.dart';
import 'package:flutter/material.dart';

import '../../auth/service/auth_services.dart';

class ProfileProvider with ChangeNotifier {
  final AuthService _authService = AuthService.instance;

  UserModel? _userData;
  UserModel? get userData => _userData;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  String? updatedName;
  String? updatedEmail;

  Future<void> userDetails() async {
    final email = await SharedPref.getUserLoggedIn();

    if (email != null) {
      final result = _authService.getUser(email);

      _userData = result;

      emailController.text = _userData?.email ?? '';
      nameController.text = _userData?.name ?? '';

      notifyListeners();
    }
  }

  void updateEmail(String val) {
    updatedEmail = val;
    notifyListeners();
  }

  void updateName(String val) {
    updatedName = val;
    notifyListeners();
  }

  void updateUserDetails(String? email, String? name) async {
    final exisintgKey = await SharedPref.getUserLoggedIn();
    if (email != null) {
      emailController.text = email;
    }
    if (name != null) {
      nameController.text = name;
    }

    _authService.updateUserDetails(
      exisintgKey ?? '',
      emailController.text,
      nameController.text,
    );
  }
}
