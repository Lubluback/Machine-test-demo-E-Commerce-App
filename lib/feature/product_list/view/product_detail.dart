import 'package:e_commerce_app_demo/core/custom_widgets/cached_network_image.dart';
import 'package:e_commerce_app_demo/core/utils/snackbar.dart';
import 'package:e_commerce_app_demo/feature/cart/model/cart_model.dart';
import 'package:e_commerce_app_demo/feature/cart/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/custom_widgets/custom_text.dart';
import '../../../core/utils/colors.dart';
import '../../home/model/product_model.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.white,
              child: Hero(
                tag: product.id,
                child: CustomNetworkImage(imageUrl: product.image),
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  CustomText(
                    text: product.title,

                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(height: 8),

                  // Category
                  CustomText(
                    text: product.category,
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),

                  const SizedBox(height: 12),

                  // Price
                  CustomText(
                    text: '₹ ${product.price.toStringAsFixed(2)}',

                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),

                  const SizedBox(height: 16),

                  // Description
                  CustomText(
                    text: product.description,

                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),

                  const SizedBox(height: 8),

                  const SizedBox(height: 30),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                      ),
                      onPressed: () {
                        final cartData = CartModel(
                          id: product.id,
                          title: product.title,
                          price: product.price,
                          description: product.description,
                          category: product.category,
                          image: product.image,
                          quantity: 1,
                        );
                        context.read<CartProvider>().addtoCart(cartData).then((
                          (bool, String) value,
                        ) {
                          if (value.$1) {
                            SnackbarUtil.show(
                              context,
                              message: value.$2,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                            );
                          } else {
                            SnackbarUtil.show(
                              context,
                              message: value.$2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                          }
                        });
                      },
                      child: const CustomText(
                        text: 'Add to Cart',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
