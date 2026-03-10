import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        USectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          padding: 0,
        ),
        Row(
          children: [
            URoundedContainer(
              width: 60,
              height: 35,
              padding: EdgeInsets.zero,
              radius: USizes.borderRadiusLg,
              showBorder: false,
              backgroundColor: dark ? UColors.darkerGrey : UColors.light,
              child: Image(image: AssetImage(UImages.masterCard)),
            ),
            SizedBox(width: USizes.spaceBtwItems),
            Text('Master Card'),
          ],
        ),
      ],
    );
  }
}
