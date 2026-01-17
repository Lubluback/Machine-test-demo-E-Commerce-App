import 'dart:developer';

import 'package:e_commerce_app_demo/feature/auth/signup/model/model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../feature/auth/service/auth_services.dart';

/*
  typeId 1 = userDB
*/

class SetupHiveAdapter {
  static const boxNames = [''];

  static Future<void> registerHiveAdapater() async {
    if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
      Hive.registerAdapter(UserModelAdapter());
    }
  }

  static Future<void> openAllBoxes() async {
    try {
      await Hive.openBox<UserModel>(AuthService.userDB);
    } catch (e) {
      log(e.toString());
    }
  }
}
