import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_app/common/widgets/products/cart/cart_items_builder.dart';
import 'package:ecommerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          final emptyWidget = UAnimationLoader(
            text: 'Cart is empty',
            showActionButton: true,
            animation: UImages.cartEmptyAnimation,
            onActionPressed: () => Get.back(),
            actionText: "Let's fill it",
          );
          return emptyWidget;
        }
        return SingleChildScrollView(
          child: Padding(
            padding: UPadding.screenPadding,
            child: UCartItemsBuilder(),
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        if (controller.cartItems.isEmpty) return SizedBox();
        return Padding(
          padding: UPadding.screenPadding,
          child: UElevatedButton(
            child: Text(
              'Checkout \$${controller.totalCartPrice.value.toStringAsFixed(2)}',
            ),
            func: () => Get.to(CheckoutScreen()),
          ),
        );
      }),
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
            onPressed: () => controller.clearCart(),
            icon: Icon(Iconsax.box_remove),
          ),
        ],
      ),
    );
  }
}
