import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final updateNameKey = GlobalKey<FormState>();

  Future<void> updateName() async {
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
      if (!updateNameKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }
      await UserRepository.instance.updateSingleField({
        "firstName": firstName.text,
        "lastName": lastName.text,
      });

      UserController.instance.user.value.firstName = firstName.text;
      UserController.instance.user.value.lastName = lastName.text;

      UFullScreenLoader.stopLoading();
      Get.offAll(NavigationMenu());
      USnackBarHelpers.successSnackBar(
        title: 'Congratulations',
        message: 'Your name has been updated',
      );
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Update name failed',
        message: e.toString(),
      );
    }
  }

  void initialize() {
    firstName.text = UserController.instance.user.value.firstName;
    lastName.text = UserController.instance.user.value.lastName;
  }
}
