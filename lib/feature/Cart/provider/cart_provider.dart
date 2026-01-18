import 'package:e_commerce_app_demo/feature/cart/model/cart_model.dart';
import 'package:flutter/material.dart';

import '../service/cart_service.dart';

class CartProvider with ChangeNotifier {
  final _cartService = CartService.instance;

  List<CartModel> _cartItems = [];
  bool _isLoading = false;
  bool _isCheckoutLoading = false;

  List<CartModel> get cartItems => _cartItems;
  bool get isLoading => _isLoading;
  bool get isCheckoutLoading => _isCheckoutLoading;

  Future<(bool, String)> addtoCart(CartModel product) async {
    final result = await _cartService.addToCart(product);
    return result;
  }

  Future<void> getAllCartItem() async {
    _isLoading = true;
    notifyListeners();

    final result = _cartService.getAllItems();
    _cartItems = result;

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateProductQuantity({
    bool isIncrease = true,
    required productId,
  }) async {
    final index = cartItems.indexWhere((e) => e.id == productId);
    // product not found
    if (index == -1) return;

    final CartModel currentItem = cartItems[index];

    final int updatedQuantity = isIncrease
        ? currentItem.quantity + 1
        : currentItem.quantity - 1;

    // Prevent quantity going below 1
    if (updatedQuantity < 1) return;
    // Max 5 item checkout in a row
    if (updatedQuantity > 5) return;

    final updatedItem = currentItem.copyWith(quantity: updatedQuantity);

    // Update Hive
    _cartService.updateProductQuantity(updatedItem);

    cartItems[index] = updatedItem;
    notifyListeners();
  }

  Future<void> removeProduct(int productId) async {
    final res = await _cartService.removeItem(productId);

    if (res) {
      _cartItems.removeWhere((e) => e.id == productId);
      notifyListeners();
    }
  }

  double calculateTotalAmount() {
    if (cartItems.isEmpty) return 0;

    double totalAmount = 0;

    for (var item in _cartItems) {
      totalAmount += item.price * item.quantity;
    }

    return totalAmount;
  }

  Future<bool> checkout() async {
    _isCheckoutLoading = true;
    notifyListeners();
    await _cartService.clearCart();

    await Future.delayed(Duration(seconds: 2));
    _isCheckoutLoading = false;

    notifyListeners();
    return true;
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
