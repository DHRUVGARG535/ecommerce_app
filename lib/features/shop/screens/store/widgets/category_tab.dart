import 'package:ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/category/category_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/category_brands.dart';
import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      padding: EdgeInsets.zero,
      children: [
        Column(
          children: [
            CategoryBrands(category: category),

            USectionHeading(
              title: 'You Might Like',
              func: () => Get.to(
                AllProductsScreen(
                  title: category.name,
                  futureMethod: controller.getProductCategory(category.id),
                ),
              ),
            ),
            FutureBuilder(
              future: controller.getProductCategory(category.id, limit: 4),
              builder: (context, asyncSnapshot) {
                final loader = UVerticalProductShimmer(itemCount: 4,);
                final widget = UCloudHelperFunctions.checkMultiRecordState(
                  snapshot: asyncSnapshot,
                  loader: loader
                );
                if (widget != null) return widget;
                final products = asyncSnapshot.data!;
                return UGridLayout(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return VerticalProductCard(product: product);
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
