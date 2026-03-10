import 'package:ecommerce_app/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(USizes.cardRadiusLg),
          topRight: Radius.circular(USizes.cardRadiusLg),
        ),
        color: dark ? UColors.darkerGrey : UColors.light,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
        child: Row(
          children: [
            UCircularIcon(
              icon: Iconsax.minus,
              backgroundColor: UColors.darkGrey,
              color: UColors.grey,
              height: 40,
              width: 40,
            ),
            SizedBox(width: USizes.spaceBtwItems),
            Text('2', style: Theme.of(context).textTheme.titleSmall),
            SizedBox(width: USizes.spaceBtwItems),
            UCircularIcon(
              icon: Iconsax.add,
              backgroundColor: UColors.black,
              color: UColors.white,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: UColors.black,
                side: BorderSide(color: UColors.black),
                padding: EdgeInsets.all(USizes.md),
              ),
              child: Row(
                children: [
                  Icon(Iconsax.shopping_bag),
                  SizedBox(width: USizes.spaceBtwItems/2),
                  Text('Add to cart'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
