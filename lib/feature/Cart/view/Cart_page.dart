import 'package:e_commerce_app_demo/core/custom_widgets/cached_network_image.dart';
import 'package:e_commerce_app_demo/feature/cart/provider/cart_provider.dart';
import 'package:e_commerce_app_demo/feature/cart/view/widget/cart_shimmer.dart';
import 'package:e_commerce_app_demo/feature/cart/view/widget/checkout_success.dart';
import 'package:e_commerce_app_demo/feature/order/model/order_model.dart';
import 'package:e_commerce_app_demo/feature/order/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/custom_widgets/custom_elevatedbutton.dart';
import '../../../core/custom_widgets/custom_text.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartProvider>().getAllCartItem();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart'), centerTitle: true),
      body: Consumer<CartProvider>(
        builder: (context, cartModel, child) {
          if (cartModel.isLoading) {
            return CartListShimmer();
          }
          if (cartModel.cartItems.isEmpty) {
            return Center(
              child: CustomText(
                text: 'No item found',
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            );
          }
          final cartItems = cartModel.cartItems;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];

              return Card(
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: CustomNetworkImage(imageUrl: item.image),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: item.title,
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              fontWeight: FontWeight.w600,
                            ),

                            const SizedBox(height: 6),
                            CustomText(
                              text: '₹ ${item.price.toStringAsFixed(2)}',

                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              cartModel.updateProductQuantity(
                                isIncrease: false,
                                productId: item.id,
                              );
                            },
                          ),
                          CustomText(
                            text: '${item.quantity}',

                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              cartModel.updateProductQuantity(
                                productId: item.id,
                              );
                            },
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          cartModel.removeProduct(item.id);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey)),
        ),
        child: Consumer<CartProvider>(
          builder: (context, cartModel, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text:
                      'Total: ₹ ${cartModel.calculateTotalAmount().toStringAsFixed(2)}',

                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),

                CustomElevatedbutton(
                  text: 'Checkout',
                  color: Colors.white,
                  width: 100,
                  height: 45,

                  onPressed: () {
                    if (!cartModel.isCheckoutLoading) {
                      cartModel.checkout().then((value) {
                        if (value) {
                          for (var items in cartModel.cartItems) {
                            final newOrder = OrderModel(
                              id: items.id,
                              title: items.title,
                              price: items.price,
                              description: items.description,
                              category: items.category,
                              image: items.image,
                              quantity: items.quantity,
                            );
                            context.read<OrderProvider>().addNewOrder(newOrder);
                          }
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutSuccessPage(),
                            ),
                            (r) => false,
                          );
                          cartModel.clearCart();
                        }
                      });
                    }
                  },
                  backgroundColor: const Color(0xff4F7B39),
                  borderRadius: 10,
                  fontsize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
