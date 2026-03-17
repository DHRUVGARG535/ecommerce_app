import 'package:ecommerce_app/data/repositories/promocode/promcode_repository.dart';
import 'package:ecommerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:ecommerce_app/features/shop/models/promo_code_model.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/helpers/pricing_calculator.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class PromocodeController extends GetxController {
  static PromocodeController get instance => Get.find();

  RxString promocode = ''.obs;
  RxBool isLoading = false.obs;
  final _repository = Get.put(PromocodeRepository());
  Rx<PromoCodeModel> appliedPromocode = PromoCodeModel.empty().obs;
  final controller = CartController.instance;

  Future<void> applyPromocode() async {
    try {
      isLoading.value = true;
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        USnackBarHelpers.warningSnackBar(title: "No internet Connection");
        return;
      }

      PromoCodeModel promocode = await _repository.fetchSinglePromocode(
        this.promocode.value,
      );

      if (promocode.id.isEmpty) {
        USnackBarHelpers.errorSnackBar(title: 'Invalid Promocode');
        return;
      }

      DateTime now = DateTime.now();
      if (promocode.endDate!.isBefore(now)) {
        USnackBarHelpers.errorSnackBar(title: 'Promocode Expired');
        return;
      }

      if (!promocode.isActive) {
        USnackBarHelpers.errorSnackBar(title: 'Promocode not Active');
        return;
      }

      double subTotal = controller.totalCartPrice.value;

      final total = UPricingCalculator.calculateTotalPrice(subTotal, 'India');
      if (total < promocode.minOrderPrice) {
        USnackBarHelpers.errorSnackBar(
          title: 'Promocode not Applicalbe',
          message:
              'Minimum order amount must be ${UTexts.currency}${promocode.minOrderPrice.toStringAsFixed(0)} to use this',
        );
        return;
      }

      if (promocode.noOfPromoCodes < 1) {
        USnackBarHelpers.errorSnackBar(
          title: 'Promocode expired',
        );
        return;
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }
}
