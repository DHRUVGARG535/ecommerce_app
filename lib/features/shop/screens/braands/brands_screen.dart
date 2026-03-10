import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/brands/brands_text_card.dart';
import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/braands/brand_products.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          USectionHeading(title: 'Brands', showViewAll: false),
          SizedBox(height: USizes.spaceBtwSections),
          GestureDetector(
            onTap: () => Get.to(BrandProducts()),
            child: UGridLayout(
              mainAxisExtent: 80,
              itemCout: 10,
              itemBuilder: (context, index) => UBrandsCard(),
            ),
          ),
        ],
      ),
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text('Brand', style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
