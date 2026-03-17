import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:ecommerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/screens/search_store/widgets/search_store_brands.dart';
import 'package:ecommerce_app/features/shop/screens/search_store/widgets/search_store_categories.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SearchStoreScreen extends StatelessWidget {
  const SearchStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxString search = ''.obs;
    return Scaffold(
      appBar: UAppBar(
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leadingIcon: Iconsax.arrow_left,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,

          child: Column(
            children: [
              Hero(
                tag: 'search_animation',
                child: Material(
                  color: Colors.transparent,
                  child: TextFormField(
                    onChanged: (value) {
                      search.value = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.search_normal),
                      label: Text('Search in store'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: USizes.spaceBtwItems),
              Obx(() {
                if (search.value.isNotEmpty) {
                  return FutureBuilder(
                    future: ProductController.instance.getAllProducts(),
                    builder: (context, snapshot) {
                      final widget =
                          UCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                          );
                      if (widget != null) return widget;

                      List<ProductModel> products = snapshot.data!
                          .where(
                            (product) => product.title.toLowerCase().contains(
                              search.toLowerCase(),
                            ),
                          )
                          .toList();

                      if (products.isEmpty) return Text('No proudcts found!');
                      return UGridLayout(
                        applyPadding: false,

                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return VerticalProductCard(product: product);
                        },
                      );
                    },
                  );
                }
                return Column(
                  children: [
                    SearchStoreBrands(),
                    SizedBox(height: USizes.spaceBtwItems),

                    SearchStoreCategories(),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
