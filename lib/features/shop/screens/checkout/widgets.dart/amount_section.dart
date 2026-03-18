import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/promocode/promocode_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AmountSection extends StatelessWidget {
  const AmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    final promocodeController = PromocodeController.instance;

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
        SizedBox(height: USizes.spaceBtwItems / 2),
        Obx(() {
          final promocode = promocodeController.appliedPromocode.value;
          if (promocode.id.isEmpty) {
            return SizedBox();
          }
          return Row(
            children: [
              Text(
                'Discount Applied',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.apply(color: UColors.success),
              ),
              Spacer(),

              Text(
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.apply(color: UColors.success),
                '- ${promocodeController.getDiscountPrice(UPricingCalculator.calculateTotalPrice(subTotal, 'India'))}',
              ),
            ],
          );
        }),

        Row(
          children: [
            Text('Order Total'),
            Spacer(),
            Obx(() {
              final promocode = promocodeController.appliedPromocode.value;
              final totalPrice = promocodeController.discountCalculate(
                promocode,
                UPricingCalculator.calculateTotalPrice(subTotal, 'India'),
              );
              return UProductPriceText(
                price: totalPrice.toStringAsFixed(2),
                isLarge: true,
              );
            }),
          ],
        ),
      ],
    );
  }
}
