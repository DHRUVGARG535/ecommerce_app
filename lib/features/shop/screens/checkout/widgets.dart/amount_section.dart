import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

class AmountSection extends StatelessWidget {
  const AmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    return Column(
      children: [
        Row(
          children: [
            Text('Subtotal'),
            Spacer(),
            UProductPriceText(price: subTotal.toString(), isLarge: false),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),

        Row(
          children: [
            Text('Shipping Fee'),
            Spacer(),
            UProductPriceText(
              price: UPricingCalculator.calculateShippingCost(
                subTotal,
                'India',
              ),
              isLarge: false,
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),
        Row(
          children: [
            Text('Tax Fee'),
            Spacer(),
            UProductPriceText(
              price: UPricingCalculator.calculateTax(subTotal, 'India'),
              isLarge: false,
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems),
        Row(
          children: [
            Text('Order Total'),
            Spacer(),
            UProductPriceText(
              price: UPricingCalculator.calculateTotalPrice(
                subTotal,
                'India',
              ).toStringAsFixed(2),
              isLarge: true,
            ),
          ],
        ),
      ],
    );
  }
}
