import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/services/firebase_service.dart';
import 'package:ecommerce_app/features/shop/models/product_category_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/key.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _firebaseServie = Get.put(FirebaseService());

  Future<void> uploadProducts(List<ProductModel> products) async {
    try {
      for (final product in products) {
        final Map<String, String> uploadImageMap = {};
        File thumbnailImage = await UHelperFunctions.assetToFile(
          product.thumbnail,
        );
        final downloadUrl = await _firebaseServie.uploadImage(
          thumbnailImage,
          UKeys.productsFolder,
        );
        uploadImageMap[product.thumbnail] = downloadUrl;
        product.thumbnail = downloadUrl;

        if (product.images != null && product.images!.isNotEmpty) {
          final List<String> imageUrls = [];

          for (String image in product.images!) {
            File imageFile = await UHelperFunctions.assetToFile(image);
            final downloadUrl = await _firebaseServie.uploadImage(
              imageFile,
              UKeys.productsFolder,
            );

            imageUrls.add(downloadUrl);
          }

          if (product.productVariations != null &&
              product.productVariations!.isNotEmpty) {
            for (int i = 0; i < product.images!.length; i++) {
              uploadImageMap[product.images![i]] = imageUrls[i];
            }

            for (final variation in product.productVariations!) {
              final match = uploadImageMap.entries.firstWhere(
                (entry) => entry.key == variation.image,
                orElse: () => const MapEntry('', ''),
              );

              if (match.key.isNotEmpty) {
                variation.image = match.value;
              }
            }
          }
          product.images!.clear();
          product.images!.assignAll(imageUrls);
        }

        await _db
            .collection(UKeys.productsCollection)
            .doc(product.id)
            .set(product.toJson());

        print('Product Uploade: ${product.title}');
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

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final query = await _db
          .collection(UKeys.productsCollection)
          .where('isFeatured', isEqualTo: true)
          .limit(4)
          .get();

      if (query.docs.isNotEmpty) {
        List<ProductModel> products = query.docs
            .map((product) => ProductModel.fromSnapshot(product))
            .toList();
        return products;
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

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final query = await _db
          .collection(UKeys.productsCollection)
          .where('isFeatured', isEqualTo: true)
          .get();

      if (query.docs.isNotEmpty) {
        List<ProductModel> products = query.docs
            .map((product) => ProductModel.fromSnapshot(product))
            .toList();
        return products;
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

  Future<List<ProductModel>> getAllProducts() async {
    try {
      final query = await _db.collection(UKeys.productsCollection).get();

      if (query.docs.isNotEmpty) {
        List<ProductModel> products = query.docs
            .map((product) => ProductModel.fromSnapshot(product))
            .toList();
        return products;
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

  Future<List<ProductModel>> getProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();

      if (querySnapshot.docs.isNotEmpty) {
        List<ProductModel> products = querySnapshot.docs
            .map((product) => ProductModel.fromQuerySnapshot(product))
            .toList();
        return products;
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

  Future<List<ProductModel>> getProductsForBrand(
    String brandId, {
    int limit = -1,
  }) async {
    try {
      final query = limit == -1
          ? await _db
                .collection(UKeys.productsCollection)
                .where('brand.id', isEqualTo: brandId)
                .get()
          : await _db
                .collection(UKeys.productsCollection)
                .where('brand.id', isEqualTo: brandId)
                .limit(limit)
                .get();

      if (query.docs.isNotEmpty) {
        List<ProductModel> products = query.docs
            .map((product) => ProductModel.fromSnapshot(product))
            .toList();
        return products;
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

  Future<List<ProductModel>> getProductsForCategoy(
    String categoryId, {
    int limit = -1,
  }) async {
    try {
      final productCategoryQuery = limit == -1
          ? await _db
                .collection(UKeys.productCategoryCollection)
                .where('categoryId', isEqualTo: categoryId)
                .get()
          : await _db
                .collection(UKeys.productCategoryCollection)
                .where('categoryId', isEqualTo: categoryId)
                .limit(limit)
                .get();

      final List<ProductCategoryModel> productCategories = productCategoryQuery
          .docs
          .map((doc) => ProductCategoryModel.fromSnapshot(doc))
          .toList();

      final List<String> productIds = productCategories
          .map((productCategory) => productCategory.productId)
          .toList();

      final productQuery = await _db
          .collection(UKeys.productsCollection)
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      final List<ProductModel> proudcts = productQuery.docs
          .map((e) => ProductModel.fromSnapshot(e))
          .toList();

      return proudcts;
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

  Future<List<ProductModel>> getFavouiteProducts(
    List<String> productIds,
  ) async {
    try {
      final productsQuery = await _db
          .collection(UKeys.productsCollection)
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      if (productsQuery.docs.isNotEmpty) {
        List<ProductModel> products = productsQuery.docs
            .map((product) => ProductModel.fromSnapshot(product))
            .toList();
        return products;
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
