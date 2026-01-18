import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<bool> isUserLoggedIn() async {
    final pref = await SharedPreferences.getInstance();
    final status = pref.getString('login-status');
    log('$status pref status');
    return status != null;
  }

  static Future<String?> getUserLoggedIn() async {
    final pref = await SharedPreferences.getInstance();
    final status = pref.getString('login-status');
    return status;
  }

  static Future<void> setUserLoginStatus(String email) async {
    final pref = await SharedPreferences.getInstance();
    log('set logging pref');

    await pref.setString('login-status', email);
  }

  static Future<void> removeUserLoginStatus() async {
    final pref = await SharedPreferences.getInstance();

    pref.remove('login-status');
  }
}
