import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/products/sortable_products.dart';
import 'package:ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/all_product/all_product_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({
    super.key,
    this.futureMethod,
    this.query,
    required this.title,
  });

  final Future<List<ProductModel>>? futureMethod;
  final Query? query;
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: futureMethod ?? controller.getProductsByQuery(query),
          builder: (context, snapshot) {
            final loader = UVerticalProductShimmer();
            final widget = UCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot,
              loader: loader,
            );

            if (widget != null) return widget;

            return SortableProductGrid(products: snapshot.data!,);
          },
        ),
      ),
    );
  }
}
