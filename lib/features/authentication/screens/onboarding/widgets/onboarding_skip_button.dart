import 'package:ecommerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
      top: UDeviceHelper.getAppBarHeight(),
      right: 0,
      child: TextButton(
        onPressed: controller.skipPage,
        child: Obx(() => Text(controller.index.value == 2 ? "" : 'Skip',style: Theme.of(context).textTheme.bodySmall,)),
      ),
    );
  }
}
