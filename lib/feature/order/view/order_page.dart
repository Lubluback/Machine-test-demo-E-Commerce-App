import 'package:e_commerce_app_demo/feature/order/provider/order_provider.dart';
import 'package:e_commerce_app_demo/feature/order/view/order_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/custom_widgets/cached_network_image.dart';
import '../../../core/custom_widgets/custom_text.dart';
import '../../../core/utils/colors.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderProvider>().getAllorderItem();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders'), centerTitle: true),
      body: Consumer<OrderProvider>(
        builder: (context, orderModel, child) {
          if (orderModel.isLoading) {
            return OrderListShimmerPage();
          }
          if (orderModel.orderItems.isEmpty) {
            return Center(
              child: CustomText(
                text: 'No item found',
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            );
          }
          final orders = orderModel.orderItems;
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];

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
                      SizedBox(
                        width: 50,
                        child: CustomNetworkImage(imageUrl: order.image),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: order.title,

                              maxLines: 2,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),

                            const SizedBox(height: 6),
                            CustomText(
                              text: order.category.toUpperCase(),

                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),

                            const SizedBox(height: 6),
                            CustomText(
                              text: '₹ ${order.price.toStringAsFixed(2)}',

                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
