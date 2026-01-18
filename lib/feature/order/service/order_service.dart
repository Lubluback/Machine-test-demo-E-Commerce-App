import 'package:e_commerce_app_demo/feature/order/model/order_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OrderService {
  static const String orderDB = 'orderBox';

  OrderService._internal();

  static OrderService instance = OrderService._internal();

  factory OrderService() {
    return instance;
  }

  final _box = Hive.box<OrderModel>(orderDB);

  Future<(bool, String)> addNewOrder(OrderModel cartProduct) async {
    try {
      final isExists = _box.containsKey(cartProduct.id);
      if (!isExists) {
        await _box.put(cartProduct.id, cartProduct);
        return (true, 'Product added to cart');
      } else {
        return (false, 'Product already in cart');
      }
    } catch (e) {
      return (false, 'Error updating cart');
    }
  }

  List<OrderModel> getAllItems() {
    try {
      return _box.values.toList();
    } catch (e) {
      return [];
    }
  }
}
