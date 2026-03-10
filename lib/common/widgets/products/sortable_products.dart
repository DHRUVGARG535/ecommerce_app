import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SortableProductGrid extends StatelessWidget {
  const SortableProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
          child: DropdownButtonFormField(
            alignment: AlignmentGeometry.center,
            decoration: InputDecoration(prefix: Icon(Iconsax.sort)),
            items: ['Name', 'Sports', 'Fashion']
                .map(
                  (value) => DropdownMenuItem(value: value, child: Text(value)),
                )
                .toList(),
            onChanged: (value) {},
          ),
        ),
        SizedBox(height: USizes.spaceBtwSections),
        UGridLayout(
          itemCout: 10,
          itemBuilder: (context, index) => VerticalProductCard(),
        ),
      ],
    );
  }
}
