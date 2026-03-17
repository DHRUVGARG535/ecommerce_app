import 'package:ecommerce_app/common/style/shadow.dart';
import 'package:ecommerce_app/features/shop/screens/search_store/search_store.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class USearchBar extends StatelessWidget {
  const USearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(SearchStoreScreen()),
      child: Hero(
        tag: 'search_animation',
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: USizes.md),
          decoration: BoxDecoration(
            boxShadow: UShadow.searchBarShadow,
            color: UHelperFunctions.isDarkMode(context)
                ? UColors.dark
                : UColors.white,
            borderRadius: BorderRadius.circular(USizes.borderRadiusLg),
          ),
          height: USizes.searchBarHeight,
          child: Row(
            children: [
              Icon(Iconsax.search_normal, color: UColors.darkGrey),
              SizedBox(width: USizes.spaceBtwItems),
              Text(
                UTexts.searchBarTitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
