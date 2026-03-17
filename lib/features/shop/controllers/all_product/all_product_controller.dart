import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/repositories/product/product_repository.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();

  final _repository = ProductRepository.instance;
  RxString sortOption = 'Name'.obs;
  RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> getProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await _repository.getProductsByQuery(query);

      return products;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Error loading products',
        message: e.toString(),
      );
      return [];
    }
  }

  void sortProducts(Object? option) {
    final sortOption = option.toString();
    this.sortOption.value = sortOption;

    switch(sortOption){
      case 'Name':
        products.sort((a,b)=>a.title.compareTo(b.title));
      case 'Newest':
        products.sort((a,b)=>a.date!.compareTo(b.date!));
      case 'Higher Price':
        products.sort((a,b)=>b.price.compareTo(a.price));
      case 'Lower Price':
        products.sort((a,b)=>a.price.compareTo(b.price));
      case 'Sale':
        products.sort((a,b){
          if(b.salePrice>0) {
            return b.salePrice.compareTo(a.salePrice);
          }
          else if(a.salePrice>0){
            return -1;
          }
          else{
            return 1;
          }
        });
      default:
          products.sort((a,b)=>a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products) {
    this.products.value = products;
  }
}
