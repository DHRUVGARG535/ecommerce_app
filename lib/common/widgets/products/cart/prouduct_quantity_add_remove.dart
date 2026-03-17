import 'package:ecommerce_app/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UProductQuanityWithAddRemove extends StatelessWidget {
  const UProductQuanityWithAddRemove({
    super.key,
    required this.quantity,
    this.add,
    this.remove, required this.price,
  });

  final int quantity;
  final String price;
  final VoidCallback? add, remove;
  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(width: 70),
        UCircularIcon(
          height: 32,
          width: 32,
          size: USizes.iconSm,
          onPressed: remove,
          icon: Iconsax.minus,
          backgroundColor: dark ? UColors.darkGrey : UColors.light,
          color: UColors.black,
        ),
        SizedBox(width: USizes.spaceBtwItems),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: USizes.spaceBtwItems),
        UCircularIcon(
          height: 32,
          width: 32,
          size: USizes.iconSm,
          onPressed: add,
          icon: Iconsax.add,
          backgroundColor: UColors.primary,
          color: UColors.white,
        ),
        Spacer(),
        UProductPriceText(price: price),
      ],
    );
  }
}
