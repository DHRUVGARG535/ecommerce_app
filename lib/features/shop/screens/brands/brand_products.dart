import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/brands/brands_text_card.dart';
import 'package:ecommerce_app/common/widgets/products/sortable_products.dart';
import 'package:ecommerce_app/common/widgets/shimmer/brands_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/brands/brands_controller.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.title, required this.brand});

  final String title;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandsController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: USizes.defaultSpace,
              ),
              child: UBrandsCard(brand: brand),
            ),
            SizedBox(height: USizes.spaceBtwSections),
            FutureBuilder(
              future: controller.getBrandProducts(brand.id),
                  
              builder: (context, asyncSnapshot) {
                final loader = UBrandsShimmer();
                Widget? widget = UCloudHelperFunctions.checkMultiRecordState(
                  snapshot: asyncSnapshot,
                  loader: loader,
                );
                if (widget != null) return widget;
                return SortableProductGrid(products: asyncSnapshot.data!);
              },
            ),
          ],
        ),
      ),
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
