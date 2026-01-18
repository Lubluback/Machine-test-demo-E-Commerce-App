import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app_demo/core/custom_widgets/custom_text.dart';
import 'package:e_commerce_app_demo/provider/product_provider.dart';
import 'package:e_commerce_app_demo/feature/home/view/widgets/home_page_shimer.dart';
import 'package:e_commerce_app_demo/feature/home/view/widgets/section_header_widget.dart';
import 'package:e_commerce_app_demo/feature/home/view/widgets/time_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/custom_widgets/cached_network_image.dart';
import '../../category_list/view/category_list.dart';
import '../../product_list/view/product_list.dart';
import 'widgets/category_widget.dart';
import 'widgets/product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Duration _offerDuration = const Duration(hours: 2);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_offerDuration.inSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _offerDuration -= const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<ProductProvider>(
            builder: (context, model, child) {
              if (model.isLoading) {
                return HomeShimmer();
              }
              if (model.products.isEmpty) {
                return Center(
                  child: CustomText(
                    text: 'No Product found',
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }
              final product = model.products;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔍 SEARCH BAR
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search products...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  /// 🖼️ BANNERS
                  SectionHeader(
                    title: 'Featured Products',
                    seeMoreNeed: false,
                    onTap: () {},
                  ),
                  CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CustomNetworkImage(imageUrl: product[0].image),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 160,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      enableInfiniteScroll: true,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// ⏰ LIMITED TIME OFFER
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: 'Limited Time Offer',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          Row(
                            children: [
                              TimeBox(
                                value: _twoDigits(_offerDuration.inHours),
                              ),
                              const Text(':'),
                              TimeBox(
                                value: _twoDigits(
                                  _offerDuration.inMinutes.remainder(60),
                                ),
                              ),
                              const Text(':'),
                              TimeBox(
                                value: _twoDigits(
                                  _offerDuration.inSeconds.remainder(60),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// 📂 CATEGORY SECTION
                  SectionHeader(
                    title: 'Categories',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CategoryPage()),
                      );
                    },
                  ),
                  CategoryPreview(topCategory: model.productCategory),

                  /// 🛒 PRODUCT SECTION
                  SectionHeader(
                    title: 'Popular Products',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProductPage()),
                      );
                    },
                  ),

                  ProductPreview(topProduct: model.products),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
