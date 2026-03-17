import 'package:ecommerce_app/data/repositories/authentication_respository.dart';
import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/authentication/models/user_model.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final singUpFormKey = GlobalKey<FormState>();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phonenumber = TextEditingController();
  final password = TextEditingController();

  RxBool isPaswordVisible = false.obs;
  RxBool isPrivacyPolicy = false.obs;

  Future<void> registerUser() async {
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

      if (!isPrivacyPolicy.value) {
        USnackBarHelpers.warningSnackBar(
          title: 'Please Accept the privacy policy first, then try again',
        );
        UFullScreenLoader.stopLoading();
        return;
      }
      if (!singUpFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      final userCredential = await AuthenticationRepository.instance
          .registerUser(email.text, password.text);
      //created model
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text,
        lastName: lastName.text,
        username: '${firstName.text}${lastName.text}53573',
        email: email.text,
        phoneNumber: phonenumber.text.trim(),
        profilePicture: '',
      );

      final userRepositroy = Get.put(UserRepository());
      userRepositroy.saveUserRecord(userModel);

      USnackBarHelpers.successSnackBar(
        title: 'Congratulation!',
        message: 'Your account has been created! Verify your email to continue',
      );
      UFullScreenLoader.stopLoading();

      Get.to(VerifyEmailScreen(email: email.text));
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
