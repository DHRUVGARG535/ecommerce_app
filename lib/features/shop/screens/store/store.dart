import 'package:ecommerce_app/common/widgets/appbar/custom_tab_bar.dart';
import 'package:ecommerce_app/common/widgets/brands/brands_text_card.dart';
import 'package:ecommerce_app/common/widgets/shimmer/brands_shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/brands/brands_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/category/category_controller.dart';
import 'package:ecommerce_app/features/shop/screens/brands/brand_products.dart';
import 'package:ecommerce_app/features/shop/screens/brands/brands_screen.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/store_primary_header.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandsController = Get.put(BrandsController());
    final controller = CategoryController.instance;
    return DefaultTabController(
      length: controller.featuredCategories.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              expandedHeight: 340,
              bottom: UTabBar(
                tabs: controller.featuredCategories
                    .map((category) => Tab(child: Text(category.name)))
                    .toList(),
              ),

              flexibleSpace: SingleChildScrollView(
                child: Column(
                  children: [
                    UStorePrimaryHeader(),
                    SizedBox(height: USizes.spaceBtwItems / 2),
                    USectionHeading(
                      title: 'Brands',
                      func: () => Get.to(BrandsScreen()),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: USizes.defaultSpace,
                      ),
                      child: Obx(() {
                        if (brandsController.isBrandLoading.value) {
                          return UBrandsShimmer();
                        }
                        if (brandsController.featuredBrands.isEmpty) {
                          return Text('Brands not found');
                        }

                        return SizedBox(
                          height: USizes.brandCardHeight,

                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final brand =
                                  brandsController.featuredBrands[index];

                              return SizedBox(
                                width: USizes.brandCardWidth,
                                child: UBrandsCard(
                                  brand: brand,
                                  onTap: () => Get.to(
                                    BrandProducts(
                                      title: brand.name,
                                      brand: brand,
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(width: USizes.spaceBtwItems),
                            itemCount: brandsController.featuredBrands.length,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: controller.featuredCategories
                .map((category) => UCategoryTab(category: category,))
                .toList(),
          ),
        ),
      ),
    );
  }
}
