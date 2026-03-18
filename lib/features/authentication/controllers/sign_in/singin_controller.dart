import 'package:ecommerce_app/data/repositories/authentication_respository.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/utils/constants/key.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SinginController extends GetxController {
  static SinginController get instance => Get.find();
  final localStorage = GetStorage();

  @override
  void onInit() {
    email.text = localStorage.read(UKeys.rememberMeEmail) ?? '';
    password.text = localStorage.read(UKeys.rememberMePassword) ?? '';
    super.onInit();
  }

  final singInFormKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();

  RxBool isRememberMe = false.obs;
  RxBool isPasswordVisible = false.obs;

  Future<void> loginUser() async {
    try {
      UFullScreenLoader.openLoadingDialog(
        'We are processing your information....',
      );
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        USnackBarHelpers.warningSnackBar(title: 'Please connect to Internet');
        UFullScreenLoader.stopLoading();
        return;
      }

      if (isRememberMe.value) {
        localStorage.write(UKeys.rememberMeEmail, email.text);
        localStorage.write(UKeys.rememberMePassword, password.text);
      }

      if (!singInFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.loginUser(
        email.text.trim(),
        password.text.trim(),
      );
      UFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
      USnackBarHelpers.successSnackBar(title: 'Successful Login');
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      UFullScreenLoader.openLoadingDialog(
        'We are processing your information....',
      );
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        USnackBarHelpers.warningSnackBar(title: 'Please connect to Internet');
        UFullScreenLoader.stopLoading();
        return; 
      }

      UserCredential credential = await AuthenticationRepository.instance
          .signInWithGoogle();

      await Get.put(UserController()).saveUserRecord(credential);

      UFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
      USnackBarHelpers.successSnackBar(title: 'Successful Login');
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
    }
  }
}
