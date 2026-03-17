import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/brands/brands_text_card.dart';
import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/shimmer/brands_shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/brands/brands_controller.dart';
import 'package:ecommerce_app/features/shop/screens/brands/brand_products.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandsController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            USectionHeading(title: 'Brands', showViewAll: false),
            SizedBox(height: USizes.spaceBtwSections),
            Obx(() {
              if (controller.isBrandLoading.value) {
                return UBrandsShimmer();
              }
              if (controller.brands.isEmpty) {
                return Text('Brands not found');
              }

              return UGridLayout(
                mainAxisExtent: 80,
                itemCount: controller.brands.length,
                itemBuilder: (context, index) {
                  final brand = controller.brands[index];
                  return UBrandsCard(
                    brand: brand,
                    onTap: () =>
                        Get.to(BrandProducts(brand: brand, title: brand.name)),
                  );
                },
              );
            }),
            SizedBox(height: USizes.spaceBtwSections),
          ],
        ),
      ),
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text('Brand', style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
