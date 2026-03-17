import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  RxInt index = 0.obs;

  final pageController = PageController();
  final localStorage = GetStorage();

  void updatePageIndicator(int value) {
    index.value = value;
  }

  void onDotClicked(int value) {
    index.value = value;
    pageController.jumpToPage(value);
  }

  void nextPage() {
    if (index.value == 2) {
      localStorage.write('firstTime', false);
      Get.offAll(Login());
    }
    index.value++;
    pageController.jumpToPage(index.value);
  }

  void skipPage() {
    index.value = 2;
    pageController.jumpToPage(index.value);
  }
}
