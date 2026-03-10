import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
      right: 0,
      left: 0,
      bottom: USizes.spaceBtwItems,

      child: UElevatedButton(
        func: controller.nextPage,
        child:   Obx(()=> Text(controller.index.value == 2 ? "Get Started" :"Next")),
      ),
    );
  }
}
