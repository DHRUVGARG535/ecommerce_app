
import 'package:ecommerce_app/common/widgets/images/circular_image.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:flutter/material.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UCircularImage(
      
      showBorder: true,
      borderWidth: 5,
      image: UImages.profileLogo,
      height: 120,
      width: 120,
    );
  }
}