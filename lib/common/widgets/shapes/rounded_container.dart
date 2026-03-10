import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class URoundedContainer extends StatelessWidget {
  const URoundedContainer({
    super.key,
    this.height,
    this.width = 400,
    this.radius = USizes.cardRadiusLg,

    this.padding,
    this.margin,
    this.child,
     this.showBorder = false,
    this.borderColor = UColors.darkGrey,
     this.backgroundColor = UColors.white,
  });
  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color? borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? BoxBorder.all(color: borderColor!) : null,
      ),
      child: child,
    );
  }
}
