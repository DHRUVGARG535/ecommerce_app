import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/services/firebase_service.dart';
import 'package:ecommerce_app/features/shop/models/brand_category_model.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/models/product_category_model.dart';
import 'package:ecommerce_app/utils/constants/key.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _firebaseServie = Get.put(FirebaseService());

  Future<void> uploadCategories(List<CategoryModel> categories) async {
    try {
      for (final category in categories) {
        File image = await UHelperFunctions.assetToFile(category.image);
        final downloadUrl = await _firebaseServie.uploadImage(
          image,
          UKeys.categoryFolder,
        );

        category.image = downloadUrl;

        await _db
            .collection(UKeys.categoryCollection)
            .doc(category.id)
            .set(category.toJson());

        print('Category uploaded ${category.name}');
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final query = await _db.collection(UKeys.categoryCollection).get();
      if (query.docs.isNotEmpty) {
        List<CategoryModel> categories = query.docs
            .map((category) => CategoryModel.fromSnapshot(category))
            .toList();
        return categories;
      }

      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> uploadBrandCategories(
    List<BrandCategoryModel> brandCategoires,
  ) async {
    try {
      for (final brandCategory in brandCategoires) {
        await _db
            .collection(UKeys.brandCategoryCollection)
            .doc()
            .set(brandCategory.toJson());

        print('Category uploaded ${brandCategory.brandId}');
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> uploadProductCategories(
    List<ProductCategoryModel> productCategoires,
  ) async {
    try {
      for (final productCategory in productCategoires) {
        await _db
            .collection(UKeys.productCategoryCollection)
            .doc()
            .set(productCategory.toJson());

        print('Category uploaded ${productCategory.productId}');
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final query = await _db
          .collection(UKeys.categoryCollection)
          .where('parentId', isEqualTo: categoryId)
          .get();
      if (query.docs.isNotEmpty) {
        List<CategoryModel> categories = query.docs
            .map((category) => CategoryModel.fromSnapshot(category))
            .toList();
        return categories;
      }

      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
