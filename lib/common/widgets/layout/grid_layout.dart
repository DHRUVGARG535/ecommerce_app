import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UGridLayout extends StatelessWidget {
  const UGridLayout({
    super.key,
    this.mainAxisExtent = 268.4,
    required this.itemCount,
    required this.itemBuilder,
    this.applyPadding = true,
  });

  final double mainAxisExtent;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final bool applyPadding;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: applyPadding
          ? EdgeInsets.symmetric(horizontal: USizes.defaultSpace)
          : EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),

      shrinkWrap: true,
      itemCount: itemCount,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: USizes.gridViewSpacing,
        crossAxisSpacing: USizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
        crossAxisCount: 2,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
