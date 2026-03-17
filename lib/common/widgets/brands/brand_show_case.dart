import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/common/widgets/brands/brands_text_card.dart';
import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({super.key, required this.images, required this.brand});

  final List<String> images;
  final BrandModel brand;

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
        backgroundColor: dark ? UColors.dark : UColors.light,
        showBorder: true,
        padding: EdgeInsets.all(USizes.md),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UBrandsCard(showBorder: false, brand: brand),
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
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, progress) =>
              UShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
