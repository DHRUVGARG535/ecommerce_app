import 'package:ecommerce_app/common/widgets/chip/choice_chip.dart';
import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          URoundedContainer(
            padding: EdgeInsets.symmetric(
              vertical: USizes.sm,
              horizontal: USizes.md,
            ),
            radius: USizes.sm,
            backgroundColor: dark ? UColors.darkerGrey : UColors.grey,
            showBorder: false,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    USectionHeading(
                      title: 'Variation',
                      showViewAll: false,
                      padding: 0,
                    ),
                    SizedBox(width: USizes.spaceBtwItems),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Price'),
                            SizedBox(width: USizes.spaceBtwItems / 4),
                            UProductPriceText(price: '699', lineThrough: true),
                            SizedBox(width: USizes.spaceBtwItems / 4),
                            UProductPriceText(price: '599', isLarge: true),
                          ],
                        ),

                        Row(
                          children: [
                            Text('Stock'),
                            SizedBox(width: USizes.sm),
                            Text(
                              'In Stock',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: USizes.spaceBtwItems / 4),

                UProductTitleText(
                  title: 'This is a product of iphone 11 with 512GB',
                  smallSize: true,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          SizedBox(height: USizes.spaceBtwItems / 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              USectionHeading(title: 'Color', showViewAll: false, padding: 0),
              SizedBox(height: USizes.spaceBtwItems / 4),

              Wrap(
                spacing: USizes.sm,
                children: [
                  UChoiceChip(
                    text: 'Yellow',
                    isSelected: true,
                    onSelected: (value) {},
                  ),
                  UChoiceChip(
                    text: 'Red',
                    isSelected: false,
                    onSelected: (value) {},
                  ),
                  UChoiceChip(
                    text: 'Blue',
                    isSelected: false,
                    onSelected: (value) {},
                  ),
                ],
              ),
            ],
          ),
        
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              USectionHeading(title: 'Storage', showViewAll: false, padding: 0),
              SizedBox(height: USizes.spaceBtwItems / 4),

              Wrap(
                spacing: USizes.sm,
                children: [
                  UChoiceChip(
                    text: 'L',
                    isSelected: true,
                    onSelected: (value) {},
                  ),
                  UChoiceChip(
                    text: 'M',
                    isSelected: false,
                    onSelected: (value) {},
                  ),
                  UChoiceChip(
                    text: 'S',
                    isSelected: false,
                    onSelected: (value) {},
                  ),
                ],
              ),
            ],
          ),
       
        ],
      ),
    );
  }
}
