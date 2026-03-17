import 'dart:io';

import 'package:ecommerce_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class FirebaseService extends GetxController {
  static FirebaseService get instance => Get.find();

  final _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File file, String folderName) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();

      final ref = _storage.ref().child("$folderName/$fileName");

      final snapshot = await ref.putFile(file);

      final downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went wrong. Please try again';
    }
  }

  Future<void> deleteImage(String profileUrl) async {
    try {
      if (isFirebaseStorageImage(profileUrl)) {
        final ref = FirebaseStorage.instance.refFromURL(profileUrl);
        await ref.delete();
      }
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went wrong. Please try again';
    }
  }

  bool isFirebaseStorageImage(String url) {
    Uri uri = Uri.parse(url);
    return uri.host.contains("firebasestorage.googleapis.com");
  }
}
