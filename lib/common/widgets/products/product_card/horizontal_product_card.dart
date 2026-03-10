import 'package:ecommerce_app/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_verify.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UHorizontalProductCard extends StatelessWidget {
  const UHorizontalProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      width: 280,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: dark ? UColors.darkerGrey : UColors.light,
        borderRadius: BorderRadius.circular(USizes.productImageRadius),
      ),
      child: Row(
        children: [
          URoundedContainer(
            height: 120,
            width: 120,
            padding: EdgeInsets.all(USizes.sm),
            backgroundColor: dark ? UColors.dark : UColors.light,
            radius: USizes.productImageRadius,

            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: URoundedImage(imageUrl: UImages.productImage15),
                ),
                Positioned(
                  top: 12,
                  child: URoundedContainer(
                    height: 20,
                    width: 36,

                    radius: USizes.cardRadiusXs,
                    backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                    child: Center(
                      child: Text(
                        "20%",
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: UColors.black),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  right: 0,
                  child: UCircularIcon(
                    height: USizes.iconLg,
                    width: USizes.iconLg,
                    size: USizes.iconSm,
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 156.0,
            child: Padding(
              padding: const EdgeInsets.only(left: USizes.sm, top: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: UProductTitleText(
                      smallSize: false,
                      title: 'Blue bata shoes',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  UBrandTitleVerify(
                    title: 'Bata',
                    maxLines: 1,
                    iconColor: dark ? UColors.white : null,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Flexible(child: UProductPriceText(price: "55", isLarge: true)),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(USizes.cardRadiusMd),
                            bottomRight: Radius.circular(USizes.cardRadiusMd),
                          ),
                          color: UColors.dark,
                        ),
                        width: USizes.iconLg * 1.2,
                        height: USizes.iconLg * 1.2,
                        child: Icon(Iconsax.add, color: UColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
