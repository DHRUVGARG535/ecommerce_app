import 'package:ecommerce_app/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:ecommerce_app/features/shop/models/payment_method_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

class UPaymentTile extends StatelessWidget {
  const UPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    final dark = UHelperFunctions.isDarkMode(context);
    return ListTile(
      onTap: () {
        controller.paymentMethod.value = paymentMethod;
        Get.back();
      },
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: EdgeInsets.all( USizes.xs),
        height: 40,
        width: 60,
        color: dark ? UColors.dark : UColors.light,
        child: Image(image: AssetImage(paymentMethod.image)),
      ),
      title: Text(paymentMethod.name),
      trailing: Icon(Iconsax.arrow_right_34),
    );
  }
}
