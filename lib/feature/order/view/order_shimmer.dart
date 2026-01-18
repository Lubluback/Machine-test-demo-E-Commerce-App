import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OrderListShimmerPage extends StatelessWidget {
  const OrderListShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // Image shimmer
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Text shimmer
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 14,
                            width: double.infinity,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 12,
                            width: 120,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 8),
                          Container(height: 16, width: 80, color: Colors.white),
                        ],
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Arrow shimmer
                    Container(height: 16, width: 16, color: Colors.white),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
