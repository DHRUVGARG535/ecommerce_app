import 'package:ecommerce_app/common/widgets/texts/brand_title_text.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UBrandTitleVerify extends StatelessWidget {
  const UBrandTitleVerify({
    super.key,
    required this.title,
     this.maxLines =1 ,
    this.textColor,
    this.iconColor = UColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      
        children: [
          UBrandTitleText(
            title: title,
            maxLines: maxLines,
            brandTextSize: brandTextSize,
            color: textColor,
            textAlign: textAlign,
          ),
          SizedBox(width: USizes.xs),
          Icon(Iconsax.verify5, color: iconColor),
        ],
      
    );
  }
}
