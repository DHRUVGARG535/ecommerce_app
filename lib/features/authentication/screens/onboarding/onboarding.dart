import 'package:ecommerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/onboarding_dot.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/widgets/onboarding_skip_button.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
     var controller = Get.put(OnboardingController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
        child: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                OnboardingPage(
                  animation: UImages.onboarding1Animation,
                  subTitle: UTexts.onBoardingSubTitle1,
                  title: UTexts.onBoardingTitle1,
                ),
                OnboardingPage(
                  animation: UImages.onboarding2Animation,
                  subTitle: UTexts.onBoardingSubTitle2,
                  title: UTexts.onBoardingTitle2,
                ),
                OnboardingPage(
                  animation: UImages.onboarding3Animation,
                  subTitle: UTexts.onBoardingSubTitle3,
                  title: UTexts.onBoardingTitle3,
                ),
              ],
            ),

            OnboardingDot(),

            OnboardingNextButton(),

            OnboardingSkipButton(),
          ],
        ),
      ),
    );
  }
}
