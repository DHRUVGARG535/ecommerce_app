import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/common/widgets/products/cart/cart_items_builder.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: UPadding.screenPadding,
        child: UCartItemsBuilder(),
      ),
      bottomNavigationBar: Padding(
        padding: UPadding.screenPadding,
        child: UElevatedButton(
          child: Text('Checkout \$8663'),
          func: () => Get.to(CheckoutScreen()),
        ),
      ),
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
