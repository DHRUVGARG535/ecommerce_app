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
    return ListView.separated(
      shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Obx(() {
        final cartItem = controller.cartItems[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            UCartItem(cartItem: cartItem),
            if (showQuantityAddRemove) ...[
              SizedBox(height: USizes.spaceBtwSections / 1.5),
              UProductQuanityWithAddRemove(
                price: (cartItem.price * cartItem.quantity).toStringAsFixed(0) ,
                quantity: cartItem.quantity,
                add: () => controller.addOneToCart(cartItem),
                remove: () => controller.removeOneFromCart(cartItem),
              ),
            ],
          ],
        );
      }),
      separatorBuilder: (context, index) =>
          SizedBox(height: USizes.spaceBtwSections),
      itemCount: controller.cartItems.length,
    );
  }
}
