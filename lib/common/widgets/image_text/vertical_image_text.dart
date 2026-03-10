import 'package:ecommerce_app/common/widgets/shapes/circular_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
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
    return Column(
      children: [
        GestureDetector(
          onTap: func,
          child: UCircularContainer(
            width: 56,
            height: 56,
            color:
                backgroundColor ??
                (UHelperFunctions.isDarkMode(context)
                    ? UColors.dark
                    : UColors.light),
            padding: EdgeInsets.all(USizes.sm),
            child: (Image.asset(image, fit: BoxFit.cover)),
          ),
        ),
        SizedBox(height: USizes.sm / 2),
        SizedBox(
          width: 56,
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: textColor),
          ),
        ),
      ],
    );
  }
}
