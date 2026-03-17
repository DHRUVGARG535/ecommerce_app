import 'package:ecommerce_app/features/authentication/controllers/sign_up/signup_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupCheckbox extends StatelessWidget {
  const SignupCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        Obx(
          ()=> Checkbox(
            
            value: controller.isPrivacyPolicy.value,
            onChanged: (value) {
              controller.isPrivacyPolicy.value = value!;
            },
          ),
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.labelLarge,
            children: [
              TextSpan(text: '${UTexts.iAgreeTo} '),
              TextSpan(
                text: UTexts.privacyPolicy,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: UHelperFunctions.isDarkMode(context)
                      ? UColors.white
                      : UColors.primary,

                  decoration: TextDecoration.underline,
                  decorationColor: UHelperFunctions.isDarkMode(context)
                      ? UColors.white
                      : UColors.primary,
                ),
              ),
              TextSpan(text: ' ${UTexts.and} '),
              TextSpan(
                text: UTexts.termsOfUse,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: UHelperFunctions.isDarkMode(context)
                      ? UColors.white
                      : UColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: UHelperFunctions.isDarkMode(context)
                      ? UColors.white
                      : UColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
