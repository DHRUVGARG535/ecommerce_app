import 'package:ecommerce_app/common/screens/success_screen.dart';
import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/common/widgets/products/cart/cart_items_builder.dart';
import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/text_fields/promocode.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets.dart/address_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets.dart/amount_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets.dart/payment_section.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              UCartItemsBuilder(showQuantityAddRemove: false),
              SizedBox(height: USizes.spaceBtwItems),
              Promocode(),
              SizedBox(height: USizes.spaceBtwItems),
              URoundedContainer(
                backgroundColor: Colors.transparent,
                radius: USizes.cardRadiusMd,
                showBorder: true,
                child: Padding(
                  padding: EdgeInsetsGeometry.all(USizes.md),
                  child: Column(
                    children: [
                      AmountSection(),
                      SizedBox(height: USizes.spaceBtwItems),
                      Divider(),
                      SizedBox(height: USizes.spaceBtwItems / 2),
                      PaymentSection(),
                      SizedBox(height: USizes.spaceBtwItems),
                      AddressSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: UPadding.screenPadding,
        child: UElevatedButton(
          child: Text('Checkout \$8663'),
          func: () => Get.to(
            SuccessScreen(
              image: UImages.successfulPaymentIcon,
              title: 'Payment Success!',
              subtitle: 'Your Item will be shipped soon!',
              func: () => Get.to(NavigationMenu()),
            ),
          ),
        ),
      ),
    );
  }
}
