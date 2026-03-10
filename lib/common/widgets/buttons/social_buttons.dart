import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(UImages.googleIcon,(){}),
        SizedBox(width: USizes.spaceBtwItems),
        buildButton(UImages.facebookIcon,(){}),
      ],
    );
  }
}

Container buildButton(String imagePath, VoidCallback func) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: UColors.grey),
      borderRadius: BorderRadius.circular(100),
    ),
    child: IconButton(
      onPressed: func,
      icon: Image.asset(imagePath, height: USizes.iconMd, width: USizes.iconMd),
    ),
  );
}
