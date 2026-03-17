import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:ecommerce_app/common/widgets/text_fields/search_bar.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/header_container.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_banner.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: USizes.homePrimaryHeaderHeight + 10),
                HeaderContainer(
                  height: USizes.homePrimaryHeaderHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UHomeAppBar(),

                      SizedBox(height: USizes.spaceBtwSections),

                      HomeCategories(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: USizes.spaceBtwSections,
                  right: USizes.spaceBtwSections,
                  child: USearchBar(),
                ),
              ],
            ),

            HomeBanner(),

            USectionHeading(
              title: 'Popular Products',
              func: () => Get.to(
                AllProductsScreen(
                  futureMethod: controller.fetchAllProducts(),
                  title: 'Popular Products',
                ),
              ),
            ),

            Obx(() {
              if (controller.isProductLoading.value) {
                return CircularProgressIndicator();
              }
              if (controller.featuredProducts.isEmpty) {
                return Text('Products noy found');
              }

              return UGridLayout(
                mainAxisExtent: 269,
                itemCount: controller.featuredProducts.length,
                itemBuilder: (context, index) {
                  final product = controller.featuredProducts[index];
                  return VerticalProductCard(product: product);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
