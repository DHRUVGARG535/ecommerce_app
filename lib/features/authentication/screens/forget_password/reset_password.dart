import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/features/authentication/controllers/reset_password/reset_password_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = ResetPasswordController.instance;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.offAll(Login()),
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: UPadding.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              UImages.mailSentImage,
              height: UDeviceHelper.getScreenWidth(context) * 0.6,
            ),
            SizedBox(height: USizes.spaceBtwItems),
            Text(
              UTexts.resetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            SizedBox(height: USizes.spaceBtwItems),
            Text(email, style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: USizes.spaceBtwItems),
            Text(
              UTexts.resetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: USizes.spaceBtwSections),
            UElevatedButton(
              child: Text(UTexts.done),
              func: () => Get.offAll(Login()),
            ),
            SizedBox(height: USizes.spaceBtwItems),
            SizedBox(
              child: TextButton(
                onPressed: controller.resendPasswordResetEmail,
                child: Text(
                  UTexts.resendEmail,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
