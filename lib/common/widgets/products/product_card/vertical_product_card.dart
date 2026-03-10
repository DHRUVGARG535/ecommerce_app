import 'package:ecommerce_app/common/style/shadow.dart';
import 'package:ecommerce_app/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_verify.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/product_details.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=>Get.to(ProductDetailsScreen()),
      child: Container(
       
        height: 180,

        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
          color: dark ? UColors.dark : UColors.light,
          boxShadow: UShadow.verticalProductShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            URoundedContainer(
              width: 180,
              padding: EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.white,
              child: Stack(
                children: [
                
                  
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
                  Center(child: URoundedImage(imageUrl: UImages.productImage15)),
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

            SizedBox(height: USizes.spaceBtwItems),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UProductTitleText(smallSize: true, title: 'Blue Bata Shoes'),
                  SizedBox(height: USizes.spaceBtwItems / 2),
                  //brand name and logo
                 UBrandTitleVerify(title: 'Bata',)
                ],
              ),
            ),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:USizes.xs),
                  child: UProductPriceText(price: "55",isLarge: true,),
                ),
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
    );
  }
}
