import 'package:e_commerce_app_demo/core/custom_widgets/cached_network_image.dart';
import 'package:e_commerce_app_demo/feature/home/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryPreview extends StatelessWidget {
  const CategoryPreview({super.key, required this.topCategory});

  final List<CategoryModel> topCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: topCategory.length > 5 ? 5 : topCategory.length,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: CustomNetworkImage(
                    imageUrl: topCategory[index].categoryImageUrl,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  topCategory[index].categoryName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
