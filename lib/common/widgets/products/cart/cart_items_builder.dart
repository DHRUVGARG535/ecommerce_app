import 'package:ecommerce_app/common/widgets/products/cart/cart_item.dart';
import 'package:ecommerce_app/common/widgets/products/cart/prouduct_quantity_add_remove.dart';
import 'package:ecommerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class UCartItemsBuilder extends StatelessWidget {
  const UCartItemsBuilder({super.key, this.showQuantityAddRemove = true});

  final bool showQuantityAddRemove;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(() {
    final items = controller.cartItems;

    if (items.isEmpty) {
      return const Center(child: Text("Cart is empty"));
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final cartItem = items[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UCartItem(cartItem: cartItem),

            if (showQuantityAddRemove) ...[
              const SizedBox(height: USizes.spaceBtwSections / 1.5),

              UProductQuanityWithAddRemove(
                price: (cartItem.price * cartItem.quantity)
                    .toStringAsFixed(0),
                quantity: cartItem.quantity,
                add: () => controller.addOneToCart(cartItem),
                remove: () => controller.removeOneFromCart(cartItem),
              ),
            ],
          ],
        );
      },
      separatorBuilder: (context, index) =>
          const SizedBox(height: USizes.spaceBtwSections),
    );
  });
  }
}
