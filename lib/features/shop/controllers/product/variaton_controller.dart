import 'package:ecommerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/product/image_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariatonController extends GetxController {
  static VariatonController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;
  RxString variatonStockStatus = ''.obs;

  void onAttributeSelected(
    ProductModel product,
    attributeName,
    attributeValue,
  ) {
    Map<String, dynamic> selectedAttributes = Map<String, dynamic>.from(
      this.selectedAttributes,
    );

    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    ProductVariationModel selectedVariation = product.productVariations!
        .firstWhere(
          (variation) => isSameAttributeValue(
            variation.attributeValues,
            selectedAttributes,
          ),
          orElse: () => ProductVariationModel.empty(),
        );

    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedImage.value = selectedVariation.image;
    }

    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController
          .getVariatonQuantityInCart(product.id,selectedVariation.id);
    }

    this.selectedVariation.value = selectedVariation;
    checkProductVariationStockStatus();
  }

  bool isSameAttributeValue(
    Map<String, dynamic> variationAttribute,
    Map<String, dynamic> selectedAttribute,
  ) {
    if (variationAttribute.length != selectedAttribute.length) return false;
    for (final key in variationAttribute.keys) {
      if (variationAttribute[key] != selectedAttribute[key]) return false;
    }

    return true;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  Set<String?> getAttributeAvailabilityInVariaton(
    List<ProductVariationModel> variations,
    String attributeName,
  ) {
    final availableAttributesValue = variations
        .where(
          (variation) =>
              variation.attributeValues[attributeName]!.isNotEmpty &&
              variation.attributeValues[attributeName] != null &&
              variation.stock > 0,
        )
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableAttributesValue;
  }

  void checkProductVariationStockStatus() {
    variatonStockStatus.value = selectedVariation.value.stock > 0
        ? 'In Stock'
        : 'Out of Stock';
  }

  void resestAttributes() {
    selectedAttributes.clear();
    variatonStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
