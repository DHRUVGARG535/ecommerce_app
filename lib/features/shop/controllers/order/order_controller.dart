import 'package:ecommerce_app/common/screens/success_screen.dart';
import 'package:ecommerce_app/data/repositories/authentication_respository.dart';
import 'package:ecommerce_app/data/repositories/order/order_repository.dart';
import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:ecommerce_app/features/shop/models/order_model.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartControler = CartController.instance;
  final addressController = AddressController.instance;
  final _repository = Get.put(OrderRepository());

  Future<void> processOrder(double totalAmount) async {
    try {
      UFullScreenLoader.openLoadingDialog('Processing your order');

      if (AuthenticationRepository.instance.currentUser!.uid.isEmpty) {
        UFullScreenLoader.stopLoading();
        return;
      }

      if (AddressController.instance.selectedAddress.value.id.isEmpty) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'Address not selected');
        return;
      }

      OrderModel order = OrderModel(
        id: UniqueKey().toString(),
        status: OrderStatus.pending,
        items: cartControler.cartItems.toList(),
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        address: addressController.selectedAddress.value,
        userId: AuthenticationRepository.instance.currentUser!.uid,
        deliveryDate: DateTime.now(),
        paymentMethod: CheckoutController.instance.paymentMethod.value.name,
      );

      await _repository.saveOrder(order);
      cartControler.clearCart();

      Get.to(
        SuccessScreen(
          image: UImages.successfulPaymentIcon,
          title: 'Payment Success!',
          subtitle: 'Your Item will be shipped soon!',
          func: () => Get.offAll(NavigationMenu()),
        ),
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<List<OrderModel>> getAllOrders() async {
    try {
      final List<OrderModel> orderList = await _repository.getAllOrder();

      return orderList;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Error Occured',
        message: e.toString(),
      );
      return [];
    }
  }
}
