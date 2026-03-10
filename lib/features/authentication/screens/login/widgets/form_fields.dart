import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/features/authentication/screens/forget_password/forget_password.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UFormFields extends StatelessWidget {
  const UFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            label: Text(UTexts.email),
            prefixIcon: Icon(Iconsax.direct_right),
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields),
        TextFormField(
          decoration: InputDecoration(
            label: Text(UTexts.password),
            prefixIcon: Icon(Iconsax.password_check),
            suffixIcon: Icon(Iconsax.eye),
          ),
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Text(UTexts.rememberMe),
              ],
            ),
            TextButton(
              onPressed: () => Get.to(ForgetPasswordScreen()),
              child: Text(
                UTexts.forgetPassword,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwSections),
        //Sing In and create account buttons
        UElevatedButton(child: Text(UTexts.signIn), func: () => Get.offAll(NavigationMenu())),
        SizedBox(height: USizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            child: Text(UTexts.createAccount),
            onPressed: () {
              Get.to(Signup());
            },
          ),
        ),
        SizedBox(height: USizes.spaceBtwSections),
      ],
    );
  }
}
