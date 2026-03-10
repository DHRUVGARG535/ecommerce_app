import 'package:ecommerce_app/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UProductQuanityWithAddRemove extends StatelessWidget {
  const UProductQuanityWithAddRemove({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 70),
        UCircularIcon(
          height: 32,
          width: 32,
          size: USizes.iconSm,
          icon: Iconsax.minus,
          backgroundColor: dark ? UColors.darkGrey : UColors.light,
          color: UColors.black,
        ),
        SizedBox(width: USizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: USizes.spaceBtwItems),
        UCircularIcon(
          height: 32,
          width: 32,
          size: USizes.iconSm,
          icon: Iconsax.add,
          backgroundColor: UColors.primary,
          color: UColors.white,
        ),
        Spacer(),
        UProductPriceText(price: '363'),
      ],
    );
  }
}
