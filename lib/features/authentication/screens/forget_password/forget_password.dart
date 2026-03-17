import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/features/authentication/controllers/reset_password/reset_password_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: UPadding.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              UTexts.forgetPassword,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: USizes.spaceBtwItems),
            Text(UTexts.forgetPasswordSubTitle),
            SizedBox(height: USizes.spaceBtwSections * 2),
            Form(
              key: controller.resetFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: (value) => UValidator.validateEmail(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  label: Text(UTexts.email),
                ),
              ),
            ),
            SizedBox(height: USizes.spaceBtwSections),
            UElevatedButton(
              child: Text(UTexts.submit),
              func: () => controller.sendPasswordResetEmail(),
            ),
          ],
        ),
      ),
    );
  }
}
