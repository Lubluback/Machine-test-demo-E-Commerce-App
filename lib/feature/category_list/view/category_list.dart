import 'package:e_commerce_app_demo/core/custom_widgets/cached_network_image.dart';
import 'package:e_commerce_app_demo/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/custom_widgets/custom_text.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories'), centerTitle: true),
      body: Consumer<ProductProvider>(
        builder: (context, model, child) {
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // ✅ 3 items per row
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
            itemCount: model.productCategory.length,
            itemBuilder: (context, index) {
              final category = model.productCategory[index];

              return Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade100,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CustomNetworkImage(
                          imageUrl: category.categoryImageUrl,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  CustomText(
                    text: category.categoryName,
                    textAlign: TextAlign.center,

                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
