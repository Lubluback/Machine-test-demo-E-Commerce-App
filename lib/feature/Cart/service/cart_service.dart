import 'package:e_commerce_app_demo/feature/cart/model/cart_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartService {
  static const String cartDB = 'cartBox';

  CartService._internal();

  static CartService instance = CartService._internal();

  factory CartService() {
    return instance;
  }

  final _box = Hive.box<CartModel>(cartDB);

  Future<(bool, String)> addToCart(CartModel cartProduct) async {
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

  Future<void> updateProductQuantity(CartModel cartProduct) async {
    try {
      final isExists = _box.containsKey(cartProduct.id);

      if (isExists) {
        _box.put(cartProduct.id, cartProduct);
      }
    } catch (e) {}
  }

  List<CartModel> getAllItems() {
    try {
      return _box.values.toList();
    } catch (e) {
      return [];
    }
  }

  Future<bool> removeItem(int productId) async {
    try {
      await _box.delete(productId);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> clearCart() async {
    try {
      await _box.clear();
    } catch (e) {}
  }
}
