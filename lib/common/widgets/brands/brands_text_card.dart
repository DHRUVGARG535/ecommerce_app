import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_verify.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBrandsCard extends StatelessWidget {
  const UBrandsCard({super.key, this.showBorder = true, required this.brand, this.onTap});

  final bool showBorder;
  final BrandModel brand;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(USizes.sm),

      height: USizes.brandCardHeight,
      showBorder: showBorder,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Flexible(
              child: URoundedImage(
                
                imageUrl: brand.image,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(width: USizes.xs),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  UBrandTitleVerify(
                    title: brand.name,
                    maxLines: 1,
                    
                    brandTextSize: TextSizes.large,
                  ),
        
                  Text(
                    '${brand.productsCount} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
