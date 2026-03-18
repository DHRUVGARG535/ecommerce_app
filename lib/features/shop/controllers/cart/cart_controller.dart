import 'package:ecommerce_app/data/repositories/authentication_respository.dart';
import 'package:ecommerce_app/features/shop/controllers/product/variaton_controller.dart';
import 'package:ecommerce_app/features/shop/models/cart_item_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/models/product_variation_model.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/key.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  final _storage = GetStorage(
    AuthenticationRepository.instance.currentUser!.uid,
  );
  RxDouble totalCartPrice = 0.0.obs;

  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  final variationController = VariatonController.instance;

  @override
  void onInit() {
    loadCartItems();
    super.onInit();
  }

  void loadCartItems() {
    List<dynamic>? cartItemsString = _storage.read(UKeys.cartItemsKey);

    if (cartItemsString != null) {
      cartItems.assignAll(
        cartItemsString.map((item) => CartItemModel.fromJson(item)).toList(),
      );
    }
    updateCartTotals();
  }

  void addTocart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      USnackBarHelpers.customToast(message: 'Select Quantity');
      return;
    }

    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      USnackBarHelpers.customToast(message: 'Select Variation');
      return;
    }

    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        USnackBarHelpers.warningSnackBar(
          title: 'Out of Stock',
          message: 'This variaton is out of stock',
        );
        return;
      } else {
        if (product.stock < 1) {
          USnackBarHelpers.warningSnackBar(
            title: 'Out of Stock',
            message: 'This product is out of stock',
          );
          return;
        }
      }
    }
    final selectedCartItem = convertToCartItem(
      product,
      productQuantityInCart.value,
    );

    int index = cartItems.indexWhere(
      (cartItem) =>
          cartItem.productId == selectedCartItem.productId &&
          selectedCartItem.variationId == cartItem.variationId,
    );

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    USnackBarHelpers.customToast(
      message: 'Your product has been added to the cart',
    );
    updateCart();
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void saveCartItems() {
    final cartItemList = cartItems.map((item) => item.toJson()).toList();

    _storage.write(UKeys.cartItemsKey, cartItemList);
  }

  void updateCartTotals() {
    double calculateTotalPrice = 0.0;
    int calculateNoOfItems = 0;

    for (final item in cartItems) {
      calculateTotalPrice += (item.price) * item.quantity.toDouble();
      calculateNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculateTotalPrice;
    noOfCartItems.value = calculateNoOfItems;
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      String variatonId =
          VariatonController.instance.selectedVariation.value.id;
      if (variatonId.isNotEmpty) {
        productQuantityInCart.value = getVariatonQuantityInCart(
          product.id,
          variatonId,
        );
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }

  void addOneToCart(CartItemModel cartItem) {
    int index = cartItems.indexWhere(
      (item) =>
          item.productId == cartItem.productId &&
          item.variationId == cartItem.variationId,
    );

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(cartItem);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel cartItem) {
    int index = cartItems.indexWhere(
      (item) =>
          item.productId == cartItem.productId &&
          item.variationId == cartItem.variationId,
    );

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        removeFromCartDialog(index);
      }
    }

    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are your sure you want to remove this product?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        USnackBarHelpers.customToast(
          message: 'Product has been removed form the cart',
        );
        Get.back();
      },
      onCancel: () {},
    );
  }

  int getProductQuantityInCart(String productId) {
    final itemQuantity = cartItems
        .where((cartItem) => cartItem.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);

    return itemQuantity;
  }

  int getVariatonQuantityInCart(String productId, String variationId) {
    CartItemModel cartItemModel = cartItems.firstWhere(
      (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );

    return cartItemModel.quantity;
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resestAttributes();
    }

    ProductVariationModel variation =
        variationController.selectedVariation.value;
    bool isVariaton = variation.id.isNotEmpty;
    String image = isVariaton ? variation.image : product.thumbnail;
    double price = isVariaton
        ? variation.salePrice > 0
              ? variation.salePrice
              : variation.price
        : product.salePrice > 0
        ? product.salePrice
        : product.price;

    return CartItemModel(
      productId: product.id,
      quantity: quantity,
      price: price,
      title: product.title,
      image: image,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariaton ? variation.attributeValues : null,
      variationId: variation.id,
    );
  }

  Future<void> directCheckout(ProductModel proudct) async {
    cartItems.clear();

    productQuantityInCart.value = 1;
    if (proudct.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      USnackBarHelpers.customToast(message: 'Please select a variaton');
    }

    if (proudct.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        USnackBarHelpers.warningSnackBar(
          title: 'Out of Stock',
          message: 'This variation is out of stock',
        );
      }
    } else {
      if (proudct.stock < 1) {
        USnackBarHelpers.warningSnackBar(
          title: 'Out of Stock',
          message: 'This product is out of stock',
        );
      }
    }

    CartItemModel selectedCartItem = convertToCartItem(proudct  , productQuantityInCart.value);
    cartItems.add(selectedCartItem);

    updateCartTotals();

    await Get.to(CheckoutScreen());

    loadCartItems();


  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
