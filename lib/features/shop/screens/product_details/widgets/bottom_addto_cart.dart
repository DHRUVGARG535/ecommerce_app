import 'package:ecommerce_app/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
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
        child: Obx(
          ()=>Row(
            children: [
              UCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: UColors.darkGrey,
                color: UColors.grey,
                height: 40,
                width: 40,
                onPressed: () {
                  controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1;
                },
              ),
              SizedBox(width: USizes.spaceBtwItems),
              Text(
                controller.productQuantityInCart.value.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(width: USizes.spaceBtwItems),
              UCircularIcon(
                icon: Iconsax.add,
                backgroundColor: UColors.black,
                color: UColors.white,
                onPressed: () => controller.productQuantityInCart.value += 1,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: controller.productQuantityInCart.value < 1
                    ? null
                    : () => controller.addTocart(product),
                style: ElevatedButton.styleFrom(
                  backgroundColor: UColors.black,
                  side: BorderSide(color: UColors.black),
                  padding: EdgeInsets.all(USizes.md),
                ),
                child: Row(
                  children: [
                    Icon(Iconsax.shopping_bag),
                    SizedBox(width: USizes.spaceBtwItems / 2),
                    Text('Add to cart'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
