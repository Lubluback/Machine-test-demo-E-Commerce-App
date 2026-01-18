import 'package:e_commerce_app_demo/core/local_db.dart/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../service/auth_services.dart';

class LoginProvider with ChangeNotifier {
  final AuthService _authService = AuthService.instance;

  String? email(val) {
    final bool name = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(val!);
    if (val.trim().isEmpty) {
      return "required email";
    } else if (!name) {
      return 'invalid email Id';
    }
    return null;
  }

  String? passwordValidation(val) {
    final bool name = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    ).hasMatch(val!);
    if (val.trim().isEmpty) {
      return "required password";
    } else if (!name) {
      return 'invalid password';
    } else {}

    return null;
  }

  int userLogin(String email, String password) {
    final result = _authService.getUser(email);

    if (result != null) {
      if (result.password != password) {
        return 1;
      }
      SharedPref.setUserLoginStatus(email);
      return 0;
    } else {
      return 2;
    }
  }
}
