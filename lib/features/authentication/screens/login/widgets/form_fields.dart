import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/features/authentication/controllers/sign_in/singin_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/forget_password/forget_password.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UFormFields extends StatelessWidget {
  const UFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SinginController.instance;
    return Form(
      key: controller.singInFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) => UValidator.validateEmail(value),
            controller: controller.email,
            decoration: InputDecoration(
              label: Text(UTexts.email),
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),
          Obx(
            ()=> TextFormField(
              obscureText: controller.isPasswordVisible.value,
              controller: controller.password,
              validator: (value) =>
                  UValidator.validateEmptyText('Password', value),
              decoration: InputDecoration(
                label: Text(UTexts.password),
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Obx(
                  ()=> IconButton(
                    onPressed: () => controller.isPasswordVisible.toggle(),
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Iconsax.eye
                          : Iconsax.eye_slash,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: USizes.spaceBtwItems / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(
                    ()=> Checkbox(value: controller.isRememberMe.value, onChanged: (value) {
                      controller.isRememberMe.toggle();
                    }),
                  ),
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
          UElevatedButton(
            child: Text(UTexts.signIn),
            func: () => controller.loginUser(),
          ),
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
      ),
    );
  }
}
