import 'dart:async';

import 'package:ecommerce_app/common/screens/success_screen.dart';
import 'package:ecommerce_app/data/repositories/authentication_respository.dart';
import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';

import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class VerifyController extends GetxController {
  static VerifyController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      USnackBarHelpers.successSnackBar(
        title: 'Email Sent',
        message: 'Email sent please check and verify',
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  void setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        Get.off(
          SuccessScreen(
            image: UImages.accountCreatedImage,
            title: UTexts.accountCreatedTitle,
            subtitle: UTexts.accountCreatedSubTitle,
            func: AuthenticationRepository.instance.screenRedirect,
          ),
        );
        timer.cancel();
      }
    });
  }

  Future<void> checkVerifiedStatus() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null && user.emailVerified) {
        Get.off(
          SuccessScreen(
            func: () => Get.to(Login()),
            image: UImages.accountCreatedImage,
            title: UTexts.accountCreatedTitle,
            subtitle: UTexts.accountCreatedSubTitle,
          ),
        );
      } else {
        USnackBarHelpers.warningSnackBar(
          title: 'Email not verified',
          message: 'Please verify your email and then try again',
        );
      }
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
