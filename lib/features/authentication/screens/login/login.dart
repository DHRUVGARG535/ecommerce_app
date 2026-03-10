import 'package:ecommerce_app/common/widgets/login%20and%20signup/form_divider.dart';
import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/buttons/social_buttons.dart';
import 'package:ecommerce_app/features/authentication/screens/login/widgets/form_fields.dart';
import 'package:ecommerce_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Login Header
              LoginHeader(),
              SizedBox(height: USizes.spaceBtwSections),
              //Text Form fields
              UFormFields(),

              //Sign in divider
              UFormDivider(title: UTexts.orSignInWith),

              //Google and facebook login buttons
              SizedBox(height: USizes.spaceBtwSections),
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
