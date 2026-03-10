import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/signup_checkbox.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  label: Text(UTexts.firstName),
                ),
              ),
            ),
            SizedBox(width: USizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  label: Text(UTexts.lastName),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwInputFields),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            label: Text(UTexts.email),
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.call),
            label: Text(UTexts.phoneNumber),
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            label: Text(UTexts.password),
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields),
        SignupCheckbox(),
        SizedBox(height: USizes.spaceBtwItems),
        UElevatedButton(
          child: Text(UTexts.createAccount),
          func: () => Get.to(VerifyEmailScreen()),
        ),
      ],
    );
  }
}
