import 'package:ecommerce_app/common/widgets/shapes/circular_container.dart';
import 'package:ecommerce_app/common/widgets/shapes/rounded_edges_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key, required this.child, required this.height});

  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return URounedEdges(
      child: Container(
        height: height,
        color: UColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -160,
              child: UCircularContainer(
                height: USizes.homePrimaryHeaderHeight,
                width: USizes.homePrimaryHeaderHeight,
               
                color: UColors.white.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              top: 50,
              right: -250,
              child: UCircularContainer(
                height: UDeviceHelper.getScreenHeight(context) * 0.4,
                width: UDeviceHelper.getScreenHeight(context) * 0.4,
               
                color: UColors.white.withValues(alpha: 0.1),
              ),
            ),

            child,
          ],
        ),
      ),
    );
  }
}
