import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import '../signup/model/model.dart';

class AuthService {
  static const String userDB = 'usersBox';

  AuthService._internal();

  static AuthService instance = AuthService._internal();

  factory AuthService() {
    return instance;
  }

  final _box = Hive.box<UserModel>(userDB);

  Future<String?> saveUser(UserModel user) async {
    log(user.email);
    try {
      final isExists = _box.containsKey(user.email);
      log('$isExists');
      getUser(user.email);
      if (!isExists) {
        await _box.put(user.email, user);
        // if null then data saved sucessfully
        return null;
      } else {
        log('exist');
        return 'User with this email already exists';
      }
    } catch (e) {
      log('exist $e');
      return e.toString();
    }
  }

  UserModel? getUser(String email) {
    try {
      if (!_box.containsKey(email)) return null;

      final data = _box.get(email);
      log('$data');
      return data;
    } catch (e) {
      log(e.toString(), name: 'getUser');
      return null;
    }
  }
}
