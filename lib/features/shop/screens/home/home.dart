import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:ecommerce_app/common/widgets/text_fields/search_bar.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/header_container.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_banner.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

            HomeBanner(
              banners: [
                UImages.homeBanner1,
                UImages.homeBanner2,
                UImages.homeBanner3,
                UImages.homeBanner4,
                UImages.homeBanner5,
              ],
            ),

            USectionHeading(
              title: UTexts.popularCategories,
              func: () => Get.to(AllProductsScreen()),
            ),

            UGridLayout(
              itemCout: 10,
              itemBuilder: (context, index) => VerticalProductCard(),
            ),
          ],
        ),
      ),
    );
  }
}
