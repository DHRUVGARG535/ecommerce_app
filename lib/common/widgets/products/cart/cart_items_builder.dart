import 'package:ecommerce_app/common/widgets/products/cart/cart_item.dart';
import 'package:ecommerce_app/common/widgets/products/cart/prouduct_quantity_add_remove.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UCartItemsBuilder extends StatelessWidget {
  const UCartItemsBuilder({super.key, this.showQuantityAddRemove = true});

  final bool showQuantityAddRemove;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          UCartItem(),
          if (showQuantityAddRemove)
            SizedBox(height: USizes.spaceBtwSections / 1.5),
          if (showQuantityAddRemove) UProductQuanityWithAddRemove(dark: dark),
        ],
      ),
      separatorBuilder: (context, index) =>
          SizedBox(height: USizes.spaceBtwSections),
      itemCount: 3,
    );
  }
}
