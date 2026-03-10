import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AmountSection extends StatelessWidget {
  const AmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Subtotal'),
            Spacer(),
            UProductPriceText(price: '7997', isLarge: false),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),

        Row(
          children: [
            Text('Shipping Fee'),
            Spacer(),
            UProductPriceText(price: '32', isLarge: false),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),
        Row(
          children: [
            Text('Tax Fee'),
            Spacer(),
            UProductPriceText(price: '231', isLarge: false),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems ),
        Row(
          children: [
            Text('Order Total'),
            Spacer(),
            UProductPriceText(price: '8663', isLarge: true),
          ],
        ),
      ],
    );
  }
}
