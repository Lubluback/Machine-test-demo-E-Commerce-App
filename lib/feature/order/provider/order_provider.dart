import 'package:e_commerce_app_demo/feature/order/service/order_service.dart';
import 'package:flutter/foundation.dart';

import '../model/order_model.dart';

class OrderProvider with ChangeNotifier {
  final _orderService = OrderService.instance;

  List<OrderModel> _orderItems = [];
  bool _isLoading = false;

  List<OrderModel> get orderItems => _orderItems;
  bool get isLoading => _isLoading;

  Future<(bool, String)> addNewOrder(OrderModel product) async {
    final result = await _orderService.addNewOrder(product);
    return result;
  }

  Future<void> getAllorderItem() async {
    _isLoading = true;
    notifyListeners();

    final result = _orderService.getAllItems();
    _orderItems = result;

    _isLoading = false;
    notifyListeners();
  }

  Future<void> clearOrder() async {
    _orderItems.clear();
    await _orderService.clearOrder();
    notifyListeners();
  }
}
