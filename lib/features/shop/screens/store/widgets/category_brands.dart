import 'package:ecommerce_app/common/widgets/brands/brand_show_case.dart';
import 'package:ecommerce_app/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:ecommerce_app/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/brands/brands_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/screens/brands/brand_products.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandsController.instance;
    return FutureBuilder(
      future: controller.getBrandCategory(category.id),
      builder: (context, asyncSnapshot) {
        final loader = Column(
          children: [
            UListTileShimmer(),
            SizedBox(height: USizes.spaceBtwItems),
            UBoxesShimmer(),
          ],
        );

        final widget = UCloudHelperFunctions.checkMultiRecordState(
          snapshot: asyncSnapshot,
          loader: loader,
        );
        if (widget != null) return widget;

        final brands = asyncSnapshot.data!;

        return ListView.builder(
          itemCount: brands.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final brand = brands[index];
            return Builder(
              builder: (context) {
                return FutureBuilder(
                  future: controller.getBrandProducts(brand.id, limit: 3),
                  builder: (context, asyncSnapshot) {
                    final widget = UCloudHelperFunctions.checkMultiRecordState(
                      snapshot: asyncSnapshot,
                    );
                    if (widget != null) return widget;
                    final products = asyncSnapshot.data!;

                    return InkWell(
                      onTap: () => Get.to(
                        BrandProducts(title: brand.name, brand: brand),
                      ),
                      child: BrandShowCase(
                        brand: brand,
                        images: products
                            .map((product) => product.thumbnail)
                            .toList(),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
