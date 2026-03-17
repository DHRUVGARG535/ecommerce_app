import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/data/services/stripe_services.dart';
import 'package:ecommerce_app/features/shop/controllers/order/order_controller.dart';
import 'package:ecommerce_app/features/shop/models/payment_method_model.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets.dart/payment_method_tile.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  Rx<PaymentMethodModel> paymentMethod = PaymentMethodModel.empty().obs;
  final orderController = Get.put(OrderController());
  final _stripeServie = Get.put(StripeServices());
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    paymentMethod.value = PaymentMethodModel(
      name: 'Cash on Delivery',
      image: UImages.codIcon,
      paymentMethod: PaymentMethods.cashOnDelivery,
    );
    super.onInit();
  }

  Future<void> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(USizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              USectionHeading(
                title: 'Payment Method',
                showViewAll: false,
                padding: 0,
              ),
              SizedBox(height: USizes.spaceBtwSections),
              UPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Cash On Delivery',
                  image: UImages.codIcon,
                  paymentMethod: PaymentMethods.cashOnDelivery,
                ),
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),
              UPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'PayPal',
                  image: UImages.paypal,
                  paymentMethod: PaymentMethods.paypal,
                ),
              ),

              SizedBox(height: USizes.spaceBtwItems / 2),
              UPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Credit Card/Debit Card',
                  image: UImages.creditCard,
                  paymentMethod: PaymentMethods.creditCard,
                ),
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkout(double amount) async {
    try {
      isLoading.value = true;
      final paymentMethod = this.paymentMethod.value.paymentMethod;

      switch (paymentMethod) {
        case PaymentMethods.cashOnDelivery:
          break;

        case PaymentMethods.creditCard:
          await _stripeServie.initPaymentSheet('usd', amount.toInt());
          await _stripeServie.showPaymentSheet();

        default:
          throw 'Payment method is not supported';
         
      }

      isLoading.value = false;

      orderController.processOrder(amount);
    } catch (e) {
      isLoading.value = false;
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    }
  }
}
