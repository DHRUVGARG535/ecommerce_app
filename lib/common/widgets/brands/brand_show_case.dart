import 'package:ecommerce_app/common/widgets/brands/brands_text_card.dart';
import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: USizes.defaultSpace,
        right: USizes.defaultSpace,
        top: USizes.md,
        bottom: USizes.md / 2,
      ),
      child: URoundedContainer(
        backgroundColor: dark?UColors.dark:UColors.light,
        showBorder: true,
        padding: EdgeInsets.all(USizes.md),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UBrandsCard(showBorder: false),
            Row(
              children: images
                  .map((image) => buildBrandImage(context, image))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBrandImage(BuildContext context, String image) {
    return Expanded(
      child: URoundedContainer(
        height: 100,
        backgroundColor: UHelperFunctions.isDarkMode(context)
            ? UColors.darkGrey
            : UColors.light,
        padding: EdgeInsets.all(USizes.sm),
        margin: EdgeInsets.only(right: USizes.sm),
        child: Image(image: AssetImage(image), fit: BoxFit.contain),
      ),
    );
  }
}
