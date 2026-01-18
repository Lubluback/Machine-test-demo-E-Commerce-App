import 'package:flutter/material.dart';

import '../../../core/custom_widgets/custom_text.dart';
import '../../../core/utils/colors.dart';

class OrderListPage extends StatelessWidget {
  //  final List<OrderModel> orders;

  const OrderListPage({
    super.key,
    //required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 11,
        itemBuilder: (context, index) {
          // final order = orders[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Image.asset(
                    "asset/png/demo_pic.png",
                    height: 70,
                    width: 70,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'order.title',

                          //  maxLines: 2,
                          //   overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),

                        const SizedBox(height: 6),
                        CustomText(
                          text: 'order.category.toUpperCase()',

                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w200,
                        ),

                        const SizedBox(height: 6),
                        CustomText(
                          text: '₹ ${100}',

                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
