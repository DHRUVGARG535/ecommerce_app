import 'package:ecommerce_app/data/repositories/authentication_respository.dart';
import 'package:ecommerce_app/features/authentication/screens/forget_password/reset_password.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get instance => Get.find();

  final email = TextEditingController();
  final resetFormKey = GlobalKey<FormState>();

  Future<void> sendPasswordResetEmail() async {
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

      if (!resetFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text,
      );

      UFullScreenLoader.stopLoading();
      Get.to(ResetPasswordScreen(email: email.text));
      USnackBarHelpers.successSnackBar(
        title: 'Email Sent',
        message: 'An Email has been sent to reset your password',
      );
    } catch (e) {
      
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Cannot reset password',
        message: e.toString(),
      );
    }
  }

  Future<void> resendPasswordResetEmail() async {
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

      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text,
      );

      UFullScreenLoader.stopLoading();

      USnackBarHelpers.successSnackBar(
        title: 'Email Sent',
        message: 'An Email has been sent to reset your password',
      );
    } catch (e) {

  UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Cannot reset password',
        message: e.toString(),
      );
    }
  }
}
