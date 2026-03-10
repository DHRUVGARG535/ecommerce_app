import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/products/cart/cart.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: USizes.md),
      child: UAppBar(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      UTexts.homeAppBarTitle,
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.apply(color: UColors.grey),
                    ),
                    Text(
                      UTexts.homeAppBarSubTitle,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: UColors.white),
                    ),
                  ],
                ),
                
                actions: [UCartCounter()],
                
      ),
    );
  }
}