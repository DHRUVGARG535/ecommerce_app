import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/common/widgets/brands/brand_show_case.dart';
import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      padding: EdgeInsets.zero,
      children: [
        Column(
          children: [
            BrandShowCase(
              images: [
                UImages.productImage47,
                UImages.productImage43,
                UImages.productImage7,
              ],
            ),
            BrandShowCase(
              images: [
                UImages.productImage47,
                UImages.productImage43,
                UImages.productImage7,
              ],
            ),

            USectionHeading(title: 'You Might Like'),
            UGridLayout(
              itemCout: 6,
              itemBuilder: (context, index) => VerticalProductCard(),
            ),
          ],
        ),
      ],
    );
  }
}
