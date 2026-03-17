import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/repositories/authentication_respository.dart';
import 'package:ecommerce_app/features/personalization/models/address_model.dart';
import 'package:ecommerce_app/utils/constants/key.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final db = FirebaseFirestore.instance;

  Future<String> uploadAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.currentUser!.uid;

      final query = await db
          .collection(UKeys.userCollection)
          .doc(userId)
          .collection(UKeys.addressCollection)
          .add(address.toJson());

      final id = query.id;
      return id;
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

  Future<List<AddressModel>> fetchAddress() async {
    try {
      final userId = AuthenticationRepository.instance.currentUser!.uid;
      if (userId.isEmpty) throw 'User not found. Please try again';
      final query = await db
          .collection(UKeys.userCollection)
          .doc(userId)
          .collection(UKeys.addressCollection)
          .get();

      final List<AddressModel> addresses = query.docs
          .map((address) => AddressModel.fromDocumentSnapshot(address))
          .toList();
      return addresses;
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

  Future<void> updateSelectedAddress(String addressId, bool isSelected) async {
    try {
      final userId = AuthenticationRepository.instance.currentUser!.uid;
      await db
          .collection(UKeys.userCollection)
          .doc(userId)
          .collection(UKeys.addressCollection)
          .doc(addressId)
          .update({'selectedAddress': isSelected});
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
