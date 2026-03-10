import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_verify.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBrandsCard extends StatelessWidget {
  const UBrandsCard({super.key, this.showBorder = true});

  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(USizes.sm),

     
      height: USizes.brandCardHeight,
      showBorder: showBorder,
      child: Row(
        children: [
          Flexible(
            child: URoundedImage(
              imageUrl: UImages.bataLogo,
              backgroundColor: Colors.transparent,
            ),
          ),  
            SizedBox(width: USizes.xs,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                UBrandTitleVerify(
                  title: 'Bata',
                  brandTextSize: TextSizes.large,
                ),
              
                Text(
                  '172 products',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
