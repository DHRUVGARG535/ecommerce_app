import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/services/firebase_service.dart';
import 'package:ecommerce_app/features/shop/models/banners_model.dart';
import 'package:ecommerce_app/utils/constants/key.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _firebaseServie = Get.put(FirebaseService());

  Future<void> uploadBanners(List<BannerModel> banners) async {
    try {
      for (final banner in banners) {
        File image = await UHelperFunctions.assetToFile(banner.imageUrl);
        final downloadUrl = await _firebaseServie.uploadImage(
          image,
          UKeys.bannersFolder,
        );

        banner.imageUrl = downloadUrl;

        await _db.collection(UKeys.bannerCollection).doc().set(banner.toJson());

        print('Banner Uploade: ${banner.targetScreen}');
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

  Future<List<BannerModel>> getBanners() async {
    try {
      final query = await _db
          .collection(UKeys.bannerCollection)
          .where('active', isEqualTo: true)
          .get();
      if (query.docs.isNotEmpty) {
        List<BannerModel> banners = query.docs
            .map((banner) => BannerModel.fromDocument(banner))
            .toList();

            print(banners.length);
        return banners;
        
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
