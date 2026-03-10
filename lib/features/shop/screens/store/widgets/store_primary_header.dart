import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/products/cart/cart.dart';
import 'package:ecommerce_app/common/widgets/text_fields/search_bar.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/header_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UStorePrimaryHeader extends StatelessWidget {
  const UStorePrimaryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
              children: [
                SizedBox(height: USizes.storePrimaryHeaderHeight + 10),
                HeaderContainer(
                  height: USizes.storePrimaryHeaderHeight,
                  child: UAppBar(
                    title: Text(
                      'Store',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge!.apply(color: UColors.white),
                    ),
                    actions: [UCartCounter()],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: USizes.spaceBtwSections,
                  right: USizes.spaceBtwSections,
                  child: USearchBar(),
                ),
              ],
            );
  }
}