import 'dart:developer';

import 'package:dio/dio.dart';
import '../core/network/dio_client.dart';
import '../feature/home/model/product_model.dart';

class ProductService {
  Future<List<ProductModel>> fetchProducts() async {
    try {
      Response response = await DioClient.dio.get('/products');

      List data = response.data;

      // log('$data', name: 'Api response');

      return data.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      log('$e', name: 'Api catch response');
      throw Exception('Failed to load products');
    }
  }
}
