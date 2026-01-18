import 'dart:developer';

import 'package:e_commerce_app_demo/feature/cart/model/cart_model.dart';
import 'package:e_commerce_app_demo/feature/cart/service/cart_service.dart';
import 'package:e_commerce_app_demo/feature/auth/signup/model/model.dart';
import 'package:e_commerce_app_demo/feature/order/model/order_model.dart';
import 'package:e_commerce_app_demo/feature/order/service/order_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../feature/auth/service/auth_services.dart';

/*
  typeId 1 = userDB
  typeId 2 = cartDB
  typeId 3 = OrderDB
  
*/

class SetupHiveAdapter {
  static const boxNames = [''];

  static Future<void> registerHiveAdapater() async {
    if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
      Hive.registerAdapter(UserModelAdapter());
    }
    if (!Hive.isAdapterRegistered(CartModelAdapter().typeId)) {
      Hive.registerAdapter(CartModelAdapter());
    }
    if (!Hive.isAdapterRegistered(OrderModelAdapter().typeId)) {
      Hive.registerAdapter(OrderModelAdapter());
    }
  }

  static Future<void> openAllBoxes() async {
    try {
      await Hive.openBox<UserModel>(AuthService.userDB);
      await Hive.openBox<CartModel>(CartService.cartDB);
      await Hive.openBox<OrderModel>(OrderService.orderDB);
    } catch (e) {
      log(e.toString());
    }
  }
}
