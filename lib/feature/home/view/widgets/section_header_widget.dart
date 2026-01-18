import 'package:e_commerce_app_demo/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool seeMoreNeed;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onTap,
    this.seeMoreNeed = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          if (seeMoreNeed)
            GestureDetector(
              onTap: onTap,
              child: const Text(
                'See more',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
        ],
      ),
    );
  }
}
