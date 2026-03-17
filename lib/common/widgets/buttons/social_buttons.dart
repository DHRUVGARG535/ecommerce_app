import 'package:ecommerce_app/features/authentication/controllers/sign_in/singin_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SinginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(UImages.googleIcon, () => controller.loginWithGoogle()),
        SizedBox(width: USizes.spaceBtwItems),
        buildButton(UImages.facebookIcon, () {}),
      ],
    );
  }
}

Container buildButton(String imagePath, VoidCallback func) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: UColors.grey),
      borderRadius: BorderRadius.circular(100),
    ),
    child: IconButton(
      onPressed: func,
      icon: Image.asset(imagePath, height: USizes.iconMd, width: USizes.iconMd),
    ),
  );
}
