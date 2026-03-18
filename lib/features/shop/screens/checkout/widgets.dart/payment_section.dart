import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = CheckoutController.instance;
    return Column(
      children: [
        USectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          padding: 0,
          func: () => controller.selectPaymentMethod(context),
        ),
        Obx(
          () => Row(
            children: [
              URoundedContainer(
                width: 60,
                height: 35,
                padding: EdgeInsets.symmetric(vertical: USizes.xs+2),
                radius: USizes.borderRadiusLg,
                showBorder: false,
                backgroundColor: dark ? UColors.light : UColors.light,
                child: Image(
                  image: AssetImage(controller.paymentMethod.value.image),
                ),
              ),
              SizedBox(width: USizes.spaceBtwItems),
              Text(controller.paymentMethod.value.name),
            ],
          ),
        ),
      ],
    );
  }
}
