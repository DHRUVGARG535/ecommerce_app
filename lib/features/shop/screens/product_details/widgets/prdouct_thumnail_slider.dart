import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart' show UColors;
import '../../../../../utils/helpers/helper_functions.dart';

class UProductThumbnailAndSlider extends StatelessWidget {
  const UProductThumbnailAndSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      color: dark ? UColors.dark : UColors.light,
      child: Stack(
        children: [
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(USizes.productImageRadius * 2),
              child: Center(child: Image(image: AssetImage(UImages.productImage15))),
            ),
          ),
          Positioned(
            left: USizes.defaultSpace,
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 80,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => URoundedImage(
                  applyImageRadius: true,
                  borderRadius: USizes.md,
                  backgroundColor: dark ? UColors.dark : UColors.white,
                  width: 80,
                  padding: EdgeInsets.all(USizes.sm),
                  boxBorder: Border.all(color: UColors.primary),
                  imageUrl: UImages.productImage47,
                ),

                separatorBuilder: (context, index) =>
                    SizedBox(width: USizes.spaceBtwItems),
                itemCount: 10,
              ),
            ),
          ),

          UAppBar(
            leadingIcon: Icons.arrow_back,
            actions: [UCircularIcon(icon: Iconsax.heart)],
          ),
        ],
      ),
    );
  }
}
