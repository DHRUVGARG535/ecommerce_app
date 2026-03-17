import 'package:ecommerce_app/data/repositories/category/category_repository.dart';
import 'package:ecommerce_app/data/repositories/product/product_repository.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class CategoryController extends GetxController {
  final _repository = Get.put(CategoryRepository());
  static CategoryController get instance => Get.find();
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  RxBool isCategoriesLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isCategoriesLoading.value = true;
      List<CategoryModel> categories = await _repository.getCategories();
      allCategories.value = categories;

      featuredCategories.assignAll(
        categories.where(
          (category) => category.isFeatured && category.parentId.isEmpty,
        ),
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Error fetching',
        message: e.toString(),
      );
    } finally {
      isCategoriesLoading.value = false;
    }
  }

  Future<List<ProductModel>> getProductCategory(
    String categoryId, {
    int limit = 4,
  }) async {
    try {
      final products = await ProductRepository.instance.getProductsForCategoy(
        categoryId,
        limit: limit,
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

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final categories = _repository.getSubCategories(categoryId);
      return categories;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }
}
