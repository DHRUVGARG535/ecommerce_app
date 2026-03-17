import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/shop/models/promo_code_model.dart';
import 'package:ecommerce_app/utils/constants/key.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PromocodeRepository extends GetxController {
  static PromocodeRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> uploadPromoCoes(List<PromoCodeModel> promocodes) async {
    try {
      for (final promocode in promocodes) {
        await _db
            .collection(UKeys.promoCodesCollection)
            .doc(promocode.id)
            .set(promocode.toJson());
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

  Future<PromoCodeModel> fetchSinglePromocode(String code) async {
    try {
      final promocodeQuery = await _db
          .collection(UKeys.promoCodesCollection)
          .where('code', isEqualTo: code)
          .get();

      if (promocodeQuery.docs.isNotEmpty) {
        final promocode = PromoCodeModel.fromSnapshot(
          promocodeQuery.docs.first,
        );
        return promocode;
      }

      return PromoCodeModel.empty();
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
