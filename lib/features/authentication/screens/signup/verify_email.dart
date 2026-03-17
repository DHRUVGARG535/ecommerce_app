import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/data/repositories/authentication_respository.dart';
import 'package:ecommerce_app/features/authentication/controllers/sign_up/verify_controller.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () =>AuthenticationRepository.instance.logout(),
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
            Text(email ?? '', style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: USizes.spaceBtwItems),
            Text(
              UTexts.verifyEmailSubTitle,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: USizes.spaceBtwSections),
            UElevatedButton(
              child: Text(UTexts.uContinue),
              func: () => controller.checkVerifiedStatus(),
            ),
            SizedBox(height: USizes.spaceBtwItems),
            SizedBox(
              child: TextButton(
                onPressed: () => controller.sendEmailVerification(),
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
