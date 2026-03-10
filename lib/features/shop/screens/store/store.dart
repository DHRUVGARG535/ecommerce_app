import 'package:ecommerce_app/common/widgets/appbar/custom_tab_bar.dart';
import 'package:ecommerce_app/common/widgets/brands/brands_text_card.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/braands/brands_screen.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/store_primary_header.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              expandedHeight: 336,
              bottom: UTabBar(
                tabs: [
                  Text('Sports'),
                  Text('Furniture'),
                  Text('Sports'),
                  Text('Sports'),
                  Text('Sports'),
                ],
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
                      child: SizedBox(
                        height: USizes.brandCardHeight,

                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => SizedBox(
                            width: USizes.brandCardWidth,
                            child: UBrandsCard(),
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: USizes.spaceBtwItems),
                          itemCount: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              UCategoryTab(),
              UCategoryTab(),
              UCategoryTab(),
              UCategoryTab(),
              UCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
