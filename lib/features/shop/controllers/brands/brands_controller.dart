import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce_app/data/repositories/brands/brands_repository.dart';
import 'package:ecommerce_app/data/repositories/product/product_repository.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class BrandsController extends GetxController {
  final _repository = Get.put(BrandsRepository());
  static BrandsController get instance => Get.find();
  RxList<BrandModel> brands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  RxBool isBrandLoading = false.obs;

  @override
  void onInit() {
    fetchBrands();
    super.onInit();
  }

  RxInt index = 0.obs;

  final controller = CarouselSliderController();

  void changeValue(int value) {
    index.value = value;
  }

  Future<void> fetchBrands() async {
    try {
      isBrandLoading.value = true;
      List<BrandModel> fetchedBrands = await _repository.getBrands();
      brands.value = fetchedBrands;
      List<BrandModel> featuredBrands = fetchedBrands
          .where((brand) => brand.isFeatured ?? false)
          .toList();

      this.featuredBrands.value = featuredBrands;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Error fetching',
        message: e.toString(),
      );
    } finally {
      isBrandLoading.value = false;
    }
  }

  Future<List<ProductModel>> getBrandProducts(
    String brandId, {
    int limit = -1,
  }) async {
    try {
      final products = await ProductRepository.instance.getProductsForBrand(
        brandId,
        limit: limit
      );

      return products;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Error fetching',
        message: e.toString(),
      );
      return [];
    }
  }

  Future<List<BrandModel>> getBrandCategory(String categoryId) async {
    try {
      final brands = await _repository.getBrandsForCategoy(categoryId);

      return brands;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Error fetching',
        message: e.toString(),
      );
      return [];
    }
  }
}
