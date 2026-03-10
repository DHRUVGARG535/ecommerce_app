import 'package:ecommerce_app/common/screens/success_screen.dart';
import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              UTexts.verifyEmailTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            SizedBox(height: USizes.spaceBtwItems),
            Text(
              'gargd53573@gmail.com',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: USizes.spaceBtwItems),
            Text(
              UTexts.verifyEmailSubTitle,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: USizes.spaceBtwSections),
            UElevatedButton(
              child: Text(UTexts.uContinue),
              func: () => Get.to(
                SuccessScreen(
                  func: ()=>Get.to(Login()),
                  image: UImages.accountCreatedImage,
                  title: UTexts.accountCreatedTitle,
                  subtitle: UTexts.accountCreatedSubTitle,
                ),
              ),
            ),
            SizedBox(height: USizes.spaceBtwItems),
            SizedBox(
              child: TextButton(
                onPressed: () {},
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
