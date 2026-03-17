import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/products/product_card/horizontal_product_card.dart';
import 'package:ecommerce_app/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/category/category_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),

      body: Padding(
        padding: UPadding.screenPadding,
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: controller.getSubCategories(category.id),
            builder: (context, asyncSnapshot) {
              final loader = UHorizontalProductShimmer();
              final widget = UCloudHelperFunctions.checkMultiRecordState(
                snapshot: asyncSnapshot,loader: loader
              );
              if (widget != null) return widget;

              final subCategories = asyncSnapshot.data!;

              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: subCategories.length,
                itemBuilder: (context, index) {
                  final subCategory = subCategories[index];
                  return FutureBuilder(
                    future: controller.getProductCategory(subCategory.id),
                    builder: (context, asyncSnapshot) {
                      
                      final widget =
                          UCloudHelperFunctions.checkMultiRecordState(
                            snapshot: asyncSnapshot,
                            loader: loader,
                          );
                      if (widget != null) return widget;
                      final products = asyncSnapshot.data!;
                      return Column(
                        children: [
                          USectionHeading(
                            title: subCategory.name,
                            padding: 0,
                            func: () => Get.to(
                              AllProductsScreen(
                                title: subCategory.name,
                                futureMethod: controller.getProductCategory(
                                  subCategory.id,
                                  limit: -1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: USizes.spaceBtwItems / 2),
                          SizedBox(
                            height: 120,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  UHorizontalProductCard(
                                    product: products[index],
                                  ),
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: USizes.spaceBtwItems),
                              itemCount: products.length,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
