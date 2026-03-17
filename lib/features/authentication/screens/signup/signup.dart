import 'package:ecommerce_app/common/widgets/login%20and%20signup/form_divider.dart';
import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/buttons/social_buttons.dart';
import 'package:ecommerce_app/features/authentication/controllers/sign_up/signup_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/sign_up_form.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: UPadding.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              UTexts.signupTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: USizes.spaceBtwSections),

            SignUpForm(),

            SizedBox(height: USizes.spaceBtwSections),
            UFormDivider(title: UTexts.orSignupWith),
            SizedBox(height: USizes.spaceBtwSections),
            SocialButtons(),
          ],
        ),
      ),
    );
  }
}
