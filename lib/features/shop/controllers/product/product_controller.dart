import 'package:ecommerce_app/data/repositories/product/product_repository.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final _repository = Get.put(ProductRepository());

  RxBool isProductLoading = false.obs;
  RxList featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isProductLoading.value = true;
      List<ProductModel> fetchedProducts = await _repository
          .getFeaturedProducts();
      featuredProducts.value = fetchedProducts;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Error fetching',
        message: e.toString(),
      );
    } finally {
      isProductLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      List<ProductModel> fetchedProducts = await _repository
          .getAllFeaturedProducts();
      return fetchedProducts;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Error fetching',
        message: e.toString(),
      );
      return [];
    }
  }

 Future<List<ProductModel>> getAllProducts() async {
    try {
      List<ProductModel> fetchedProducts = await _repository
          .getAllProducts();
      return fetchedProducts;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Error fetching',
        message: e.toString(),
      );
      return [];
    }
  }

  String? discountCalculate(double originalPrice, double? discountedPrice) {
    if (discountedPrice == null || discountedPrice <= 0.0) return null;

    if (originalPrice <= 0.0) return null;
    double percentage = (originalPrice - discountedPrice) / originalPrice * 100;

    return percentage.toStringAsFixed(1);
  }

  String getPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return product.salePrice > 0
          ? product.salePrice.toString()
          : product.price.toString();
    } else {
      for (final variaton in product.productVariations!) {
        double variationPrice = variaton.salePrice > 0
            ? variaton.salePrice
            : variaton.price;

        if (variationPrice < smallestPrice) smallestPrice = variationPrice;
        if (variationPrice > largestPrice) largestPrice = variationPrice;
      }

      if (smallestPrice == largestPrice) {
        return smallestPrice.toStringAsFixed(0);
      } else {
        return '${smallestPrice.toStringAsFixed(0)} - ${UTexts.currency}${largestPrice.toStringAsFixed(0)}';
      }
    }
  }

  String isInStock(int stock) {
    return stock > 0 ? 'In Stock' : "Out of Stock";
  }
}
