import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class URoundedImage extends StatelessWidget {
  const URoundedImage({
    super.key,

    required this.imageUrl,
    this.width,
    this.height,
    this.applyImageRadius = true,
    this.boxBorder,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = USizes.borderRadiusMd,
  });

  final String imageUrl;
  final double? width, height;
  final bool applyImageRadius;
  final BoxBorder? boxBorder;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: boxBorder,
          color: backgroundColor,
        ),
        height: height,
        width: width,
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadiusGeometry.circular(borderRadius)
              : BorderRadiusGeometry.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: fit,
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                  placeholder: (context, url) {
                    return UShimmerEffect(width: double.infinity, height: height ?? 190);
                  },
                )
              : Image.asset(imageUrl, fit: fit),
        ),
      ),
    );
  }
}
