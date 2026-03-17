import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:ecommerce_app/features/shop/controllers/all_product/all_product_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SortableProductGrid extends StatelessWidget {
  const SortableProductGrid({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
          child: DropdownButtonFormField(
            initialValue: controller.sortOption.value,

            alignment: AlignmentGeometry.center,
            decoration: InputDecoration(prefix: Icon(Iconsax.sort)),
            items: ['Name', 'Lower Price', 'Higher Price', 'Sale', 'Newest']
                .map(
                  (value) => DropdownMenuItem(value: value, child: Text(value)),
                )
                .toList(),
            onChanged: (value) => controller.sortProducts(value),
          ),
        ),
        SizedBox(height: USizes.spaceBtwSections),
        Obx(
          () => UGridLayout(
            
            itemCount: controller.products.length,
            itemBuilder: (context, index) =>
                VerticalProductCard(product: controller.products[index]),
          ),
        ),
      ],
    );
  }
}
