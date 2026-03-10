import 'package:ecommerce_app/features/shop/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

class UCartCounter extends StatelessWidget {
  const UCartCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(CartScreen()),
          icon: Icon(Iconsax.shopping_bag, color: UColors.light),
        ),
        Positioned(
          top: 3,
          right: 6,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dark ? UColors.dark : UColors.light,
            ),
            height: 18,
            width: 18,
            child: Center(
              child: Text(
                "2",
                style: Theme.of(context).textTheme.labelLarge!.apply(
                  fontSizeFactor: 0.8,
                  color: dark ? UColors.light : UColors.dark,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
