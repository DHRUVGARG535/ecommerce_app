import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/favourite/favourite_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/product/variaton_controller.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class UBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariatonController());
    Get.put(FavouriteController());
    Get.put(AddressController());
  }
}
