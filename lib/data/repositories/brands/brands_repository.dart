import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/services/firebase_service.dart';
import 'package:ecommerce_app/features/shop/models/brand_category_model.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/utils/constants/key.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class BrandsRepository extends GetxController {
  static BrandsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _firebaseServie = Get.put(FirebaseService());

  Future<void> uploadBrands(List<BrandModel> brands) async {
    try {
      for (final brand in brands) {
        File image = await UHelperFunctions.assetToFile(brand.image);
        final downloadUrl = await _firebaseServie.uploadImage(
          image,
          UKeys.brandsFolder,
        );

        brand.image = downloadUrl;

        await _db
            .collection(UKeys.brandsCollection)
            .doc(brand.id)
            .set(brand.toJson());

        print('Brand uploaded ${brand.name}');
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<BrandModel>> getBrands() async {
    try {
      final query = await _db.collection(UKeys.brandsCollection).get();
      if (query.docs.isNotEmpty) {
        List<BrandModel> brands = query.docs
            .map((brand) => BrandModel.fromSnapshot(brand))
            .toList();
        return brands;
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

  Future<List<BrandModel>> getBrandsForCategoy(String categoryId) async {
    try {
      final brandCategoryQuery = await _db
          .collection(UKeys.brandCategoryCollection)
          .where('categoryId', isEqualTo: categoryId)
          .get();

      final List<BrandCategoryModel> brandCategories = brandCategoryQuery.docs
          .map((doc) => BrandCategoryModel.fromSnapshot(doc))
          .toList();

      final List<String> brandIds = brandCategories
          .map((brandCategory) => brandCategory.brandId)
          .toList();

      final brandsQuery = await _db
          .collection(UKeys.brandsCollection)
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(3)
          .get();

      final List<BrandModel> brands = brandsQuery.docs
          .map((e) => BrandModel.fromSnapshot(e))
          .toList();

      return brands;
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
