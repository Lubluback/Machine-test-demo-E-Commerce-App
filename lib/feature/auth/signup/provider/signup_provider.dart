import 'package:flutter/material.dart';

import '../../service/auth_services.dart';
import '../model/model.dart';

class SignupProvider with ChangeNotifier {
  final AuthService _authService = AuthService.instance;

  String? emailvalidation(String val) {
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(val);
    if (val.trim().isEmpty) {
      return "email is required";
    } else if (!emailValid) {
      return "not valid";
    }
    return null;
  }

  String? passwordValidation(String val) {
    if (val.trim().isEmpty) {
      return "required name";
    } else if (val.length < 6) {
      return 'Password should atleast 6 character';
    }
    return null;
  }

  String? username(String val) {
    final bool name = RegExp('[a-zA-Z]').hasMatch(val);
    if (val.trim().isEmpty) {
      return "required name";
    } else if (!name) {
      return 'invalid username';
    } else if (val.length < 3) {
      return 'Please enter fullname';
    }
    return null;
  }

  Future<String?> createAccount(UserModel user) async {
    final result = await _authService.saveUser(user);
    return result;
  }
}
