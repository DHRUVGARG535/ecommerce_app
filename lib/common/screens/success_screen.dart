import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.func,
  });

  final String image, title, subtitle;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        padding: UPadding.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: UDeviceHelper.getScreenWidth(context) * 0.6,
            ),
            SizedBox(height: USizes.spaceBtwItems),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: USizes.spaceBtwItems),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: USizes.spaceBtwSections),
            UElevatedButton(func: func, child: Text(UTexts.uContinue)),
          ],
        ),
      ),
    );
  }
}
