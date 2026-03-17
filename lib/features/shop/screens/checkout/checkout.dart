import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/common/widgets/loaders/screen_partial_loading.dart';
import 'package:ecommerce_app/common/widgets/products/cart/cart_items_builder.dart';
import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/text_fields/promocode.dart';
import 'package:ecommerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets.dart/address_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets.dart/amount_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets.dart/payment_section.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/helpers/pricing_calculator.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.put(CheckoutController());
    final controller = CartController.instance; 
    double subTotal = controller.totalCartPrice.value;

    final total = UPricingCalculator.calculateTotalPrice(
      controller.totalCartPrice.value,
      'India',
    );
    return Obx(
      ()=>UPartialScreenLoading(
        isLoading: checkoutController.isLoading.value,
        child: Scaffold(
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
              func: subTotal > 0
                  ? () => checkoutController.checkout(total)
                  : () => USnackBarHelpers.errorSnackBar(
                      title: 'Empty Cart',
                      message: 'Add items to cart',
                    ),
              child: Text('Checkout ${UTexts.currency}${total.toStringAsFixed(2)}'),
            ),
          ),
        ),
      ),
    );
  }
}
