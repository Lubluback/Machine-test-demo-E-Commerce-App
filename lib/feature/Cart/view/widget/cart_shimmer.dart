import 'package:flutter/material.dart';

import '../../../../core/custom_widgets/app_shimmer.dart';

class CartListShimmer extends StatelessWidget {
  const CartListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (_, index) {
        return Card(
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: AppShimmer(
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  const SizedBox(width: 12),

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
                        Container(height: 18, width: 100, color: Colors.white),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      _iconBox(),
                      const SizedBox(width: 6),
                      Container(height: 18, width: 20, color: Colors.white),
                      const SizedBox(width: 6),
                      _iconBox(),
                    ],
                  ),

                  const SizedBox(width: 8),

                  _iconBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _iconBox() {
    return Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
