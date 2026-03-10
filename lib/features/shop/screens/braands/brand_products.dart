import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/brands/brands_text_card.dart';
import 'package:ecommerce_app/common/widgets/products/sortable_products.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
              child: UBrandsCard(),
            ),
            SizedBox(height: USizes.spaceBtwSections),
            SortableProductGrid(),
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
