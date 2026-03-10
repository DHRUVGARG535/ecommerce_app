import 'package:ecommerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingDot extends StatelessWidget {
  const OnboardingDot({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
      bottom: UDeviceHelper.getBottomNavigationBarHeight() * 4,
      left: UDeviceHelper.getScreenWidth(context) / 3,
      right: UDeviceHelper.getScreenWidth(context) / 3,

      child: SmoothPageIndicator(
        onDotClicked: controller.onDotClicked,
        effect: ExpandingDotsEffect(dotHeight: 6.0),
        controller: controller.pageController,
        count: 3,
      ),
    );
  }
}
