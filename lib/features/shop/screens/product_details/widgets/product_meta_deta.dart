import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_verify.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              URoundedContainer(
                height: 20,
                width: 36,

                radius: USizes.cardRadiusXs,
                backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                child: Center(
                  child: Text(
                    "20%",
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge!.apply(color: UColors.black),
                  ),
                ),
              ),
              SizedBox(width: USizes.spaceBtwItems),
              UProductPriceText(price: '399', lineThrough: true),
              SizedBox(width: USizes.spaceBtwItems),
              UProductPriceText(
                price: '599',
                lineThrough: false,
                isLarge: true,
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            ],
          ),
          SizedBox(height: USizes.sm),
          UProductTitleText(smallSize: false, title: 'Blue Shoes of Nike'),
          SizedBox(height: USizes.sm),
          Row(
            children: [
              UProductTitleText(smallSize: false, title: 'Status'),
              SizedBox(width: USizes.sm),
              Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          SizedBox(height: USizes.spaceBtwItems / 2),

          Row(
            children: [
              SizedBox(
                height: 56,
                child: Image(image: AssetImage(UImages.bataLogo)),
              ),
              SizedBox(width: USizes.spaceBtwItems / 2),
              UBrandTitleVerify(title: 'Bata'),
              SizedBox(height: USizes.spaceBtwItems / 2),
            ],
          ),
          SizedBox(height: USizes.spaceBtwItems / 2),
        ],
      ),
    );
  }
}
