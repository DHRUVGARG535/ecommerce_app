import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class UCircularContainer extends StatelessWidget {
  const UCircularContainer({
    super.key,
    this.height = 400,
    this.width = 400,

    this.color = UColors.white,
    this.padding,
    this.margin,
    this.child,
  });

  final double height, width;
  final Widget? child;
  final Color color;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: child,
    );
  }
}
