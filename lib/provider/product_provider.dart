import 'package:flutter/material.dart';
import '../feature/home/model/category_model.dart';
import '../feature/home/model/product_model.dart';
import '../service/product_service.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<ProductModel> _products = [];
  bool _isLoading = false;
  String? _error;
  final List<CategoryModel> _productCategory = [];

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<CategoryModel> get productCategory => _productCategory;

  Future<void> fetchProducts() async {
    if (_products.isNotEmpty) {
      // Calling api to rate limit
      return;
    }
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _products = await _service.fetchProducts();
      extractProcutCategory(_products);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void extractProcutCategory(List<ProductModel> products) {
    _productCategory.clear();
    for (final product in products) {
      final isAlreadyAdded = _productCategory.any(
        (e) => e.categoryName == product.category,
      );

      if (!isAlreadyAdded) {
        _productCategory.add(
          CategoryModel(
            categoryName: product.category,
            categoryImageUrl: product.image,
          ),
        );
      }
    }
    notifyListeners();
  }
}
