import 'dart:convert';

import 'package:ecommerce_app/data/repositories/authentication_respository.dart';
import 'package:ecommerce_app/data/repositories/product/product_repository.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/key.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();
  RxMap<String, bool> favourites = <String, bool>{}.obs;
  late final GetStorage _storage;
  @override
  void onInit() {
    final user = AuthenticationRepository.instance.currentUser;

    if (user != null) {
      _storage = GetStorage(user.uid);
    } else {
      _storage = GetStorage();
    }

    initFavouites();
    super.onInit();
  }

  void toogleFavouriteIcon(String productId) {
    if (favourites.containsKey(productId)) {
      favourites.remove(productId);
      saveFavouriteToStorage();
      USnackBarHelpers.customToast(
        message: 'Product has been removed from wishlist',
      );
    } else {
      favourites[productId] = true;
      saveFavouriteToStorage();
      USnackBarHelpers.customToast(
        message: 'Product has been added to wishlist',
      );
    }
  }

  void initFavouites() {
    String? encodedFavouries = _storage.read(UKeys.favourite);
    if (encodedFavouries == null) return;
    Map<String, dynamic> favourites = jsonDecode(encodedFavouries);
    this.favourites.assignAll(
      favourites.map((key, value) => MapEntry(key, value as bool)),
    );
  }

  void saveFavouriteToStorage() {
    _storage.write(UKeys.favourite, jsonEncode(favourites));
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  Future<List<ProductModel>> getFavouriteProducts() async {
    final productIds = favourites.keys.toList();
    final prouducts = await ProductRepository.instance.getFavouiteProducts(
      productIds,
    );
    return prouducts;
  }
}
