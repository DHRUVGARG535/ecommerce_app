import 'package:ecommerce_app/common/widgets/images/circular_image.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.title,
    required this.image,
    required this.textColor,
    this.backgroundColor,
    this.func,
  });

  final String title;
  final String image;
  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback? func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: func,
      child: Column(
        
        children: [
          UCircularImage(
            image: image,
            width: 56,
            height: 56,
            isNetworkImage: true,
          ),  

          SizedBox(height: USizes.sm / 2),
          SizedBox(
         
            child: Text(
              textAlign: TextAlign.center,
              title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
