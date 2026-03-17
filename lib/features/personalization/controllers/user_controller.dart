import 'dart:io';

import 'package:ecommerce_app/data/repositories/authentication_respository.dart';
import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/data/services/firebase_service.dart';
import 'package:ecommerce_app/features/authentication/models/user_model.dart';
import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/features/personalization/screens/edit_profile/widgets/reauthenticate_user.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  final email = TextEditingController();
  final password = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;
  RxBool isProfileUploading = false.obs;

  final userRepository = Get.put(UserRepository());

  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;

  Future<void> saveUserRecord(UserCredential credential) async {
    try {
      final nameParts = UserModel.nameParts(credential.user!.displayName);
      final userName = '${nameParts[0]}${nameParts[1]}53573';
      UserModel userModel = UserModel(
        id: credential.user!.uid,
        firstName: nameParts[0],
        lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : " ",
        username: userName,
        email: credential.user!.email ?? '',
        phoneNumber: credential.user!.phoneNumber ?? '',
        profilePicture: credential.user!.photoURL ?? '',
      );

      await userRepository.saveUserRecord(userModel);
    } catch (e) {
      USnackBarHelpers.warningSnackBar(
        title: 'Data not Saved',
        message: 'Something went wrong while saving your information',
      );
    }
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      UserModel user = await userRepository.fetchUserRecord();
      this.user.value = user;
    } catch (e) {
      user.value = UserModel.empty();
    } finally {
      profileLoading.value = false;
    }
  }

  void deletaAccountWarning() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(USizes.md),
      title: 'Delete account',
      middleText: 'Are your sure you want to delete your account permanently?',
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: Colors.red),
          backgroundColor: Colors.red,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.lg),
          child: Text('Delete'),
        ),
        onPressed: () => deleteUserRecord(),
      ),
      cancel: OutlinedButton(onPressed: Get.back, child: Text('Cancel')),
    );
  }

  Future<void> deleteUserRecord() async {
    try {
      UFullScreenLoader.openLoadingDialog('Processing....');

      final authRepository = AuthenticationRepository.instance;

      final provider = authRepository.currentUser!.providerData
          .map((e) => e.providerId)
          .first;

      if (provider == 'google.com') {
        await authRepository.signInWithGoogle();
        await authRepository.deleteUserAccount();
        UFullScreenLoader.stopLoading();
        Get.offAll(Login());
        USnackBarHelpers.successSnackBar(
          title: 'Success',
          message: 'Your account has been successfully deleted',
        );
      } else if (provider == 'password') {
        UFullScreenLoader.stopLoading();
        Get.to(ReauthenticateUser());
      }
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Error Occured',
        message: e.toString(),
      );
    }
  }

  Future<void> reauthenticateUser() async {
    try {
      UFullScreenLoader.openLoadingDialog('Processing....');
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        USnackBarHelpers.warningSnackBar(title: 'Please connect to Internet');
        UFullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();

        return;
      }

      await AuthenticationRepository.instance.reauthticateUser(
        email.text.trim(),
        password.text.trim(),
      );
      await AuthenticationRepository.instance.deleteUserAccount();
      UFullScreenLoader.stopLoading();
      Get.offAll(Login());
      USnackBarHelpers.successSnackBar(
        title: 'Success',
        message: 'Your account has been successfully deleted',
      );
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Cannot delete account',
        message: e.toString(),
      );
    }
  }

  Future<void> updateUserProiflePicture() async {
    try {
      isProfileUploading.value = true;

      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        USnackBarHelpers.warningSnackBar(title: 'Please connect to Internet');

        return;
      }
      XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image == null) {
        return;
      }

      File file = File(image.path);
      if (user.value.profilePicture.isNotEmpty) {
        await FirebaseService.instance.deleteImage(user.value.profilePicture);
      }

      final downloadUrl = await userRepository.uplodadImage(file);

      await userRepository.updateSingleField({'profilePicture': downloadUrl});
      user.value.profilePicture = downloadUrl;

      user.refresh();

      USnackBarHelpers.successSnackBar(
        title: 'Congratulation',
        message: 'Profile pictured upadated Successfully',
      );
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Error updating image',
        message: e.toString(),
      );
    } finally {
      isProfileUploading.value = false;
    }
  }
}
