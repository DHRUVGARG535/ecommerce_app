import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_verify.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/features/shop/models/cart_item_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UCartItem extends StatelessWidget {
  const UCartItem({super.key, required this.cartItem});

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        URoundedImage(
          backgroundColor: dark ? UColors.darkerGrey : UColors.light,
          padding: EdgeInsets.all(USizes.xs),
          isNetworkImage: true,
          imageUrl: cartItem.image ?? '',
          height: 60,
          width: 60,
        ),
        SizedBox(width: USizes.spaceBtwItems),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UBrandTitleVerify(title: cartItem.brandName ?? ''),
              UProductTitleText(
                smallSize: false,
                title: cartItem.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {}).entries
                      .map(
                        (item) => TextSpan(
                          children: [
                            TextSpan(
                              text: '${item.key} ',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: '${item.value} ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
           
           
            ],
          ),
        ),
      ],
    );
  }
}
