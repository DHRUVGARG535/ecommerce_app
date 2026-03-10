import 'package:ecommerce_app/common/widgets/images/user_profile_logo.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/header_container.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProfilePrimaryHeader extends StatelessWidget {
  const ProfilePrimaryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: USizes.profilePrimaryHeaderHeight + 60),
        HeaderContainer(
          height: USizes.profilePrimaryHeaderHeight,
          child: Container(),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(child: UserProfileLogo()),
        ),
      ],
    );
  }
}
