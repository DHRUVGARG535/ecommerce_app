import 'package:ecommerce_app/data/repositories/authentication_respository.dart';
import 'package:ecommerce_app/data/repositories/promocode/promcode_repository.dart';
import 'package:ecommerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:ecommerce_app/features/shop/models/promo_code_model.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
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
        USnackBarHelpers.errorSnackBar(title: 'Promocode expired');
        return;
      }

      final userIds = promocode.userIds ?? [];
      final currentUser = AuthenticationRepository.instance.currentUser!.uid;
      if (userIds.contains(currentUser)) {
        USnackBarHelpers.errorSnackBar(
          title: 'Already Applied',
          message: 'You have already applied this promocode',
        );
        return;
      }

      appliedPromocode.value = promocode;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Promo code Error',
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  double discountCalculate(PromoCodeModel promocode, double total) {
    if (promocode.id.isNotEmpty) {
      if (promocode.discountType == DiscountType.fixed) {
        return UPricingCalculator.calculateFixedDiscount(
          total,
          promocode.discount,
        );
      } else {
        return UPricingCalculator.calculatePercentageDiscount(
          total,
          promocode.discount,
        );
      }
    }

    return total;
  }

  String getDiscountPrice(double total) {
    if (appliedPromocode.value.id.isEmpty) {
      return '';
    }
    if (appliedPromocode.value.discountType == DiscountType.fixed) {
      return '${UTexts.currency}${appliedPromocode.value.discount}';
    } else {
      final discount = (total * appliedPromocode.value.discount) / 100;
      return '${UTexts.currency}$discount';
    }
  }

  Future<void> decreaseNumberOfPromocode() async {
    try {
      if (appliedPromocode.value.id.isEmpty) return;
      await _repository.updateSingleField(
        appliedPromocode.value,
        'noOfPromoCodes',
        appliedPromocode.value.noOfPromoCodes - 1,
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Promocode Erro',
        message: e.toString(),
      );
    }
  }

  Future<void> addUserToPromocode() async {
    try {
      if (appliedPromocode.value.id.isEmpty) return;
      final userIds = appliedPromocode.value.userIds ?? [];

      userIds.add(AuthenticationRepository.instance.currentUser!.uid);

      await _repository.updateSingleField(
        appliedPromocode.value,
        'userIds',
        userIds,
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Promocode Error',
        message: e.toString(),
      );
    }
  }
}
