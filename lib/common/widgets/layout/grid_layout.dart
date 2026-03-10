import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UGridLayout extends StatelessWidget {
  const UGridLayout({
    super.key,
    this.mainAxisExtent = 251.4,
    required this.itemCout,
    required this.itemBuilder,
  });

  final double mainAxisExtent;
  final int itemCout;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      
      
      padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
      physics: NeverScrollableScrollPhysics(),

      shrinkWrap: true,
      itemCount: itemCout,

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
