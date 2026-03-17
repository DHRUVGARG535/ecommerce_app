import 'package:ecommerce_app/common/widgets/images/circular_image.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Obx(() {
      final isProfileLogo = controller.user.value.profilePicture.isNotEmpty;
      return controller.isProfileUploading.value
          ? UShimmerEffect(width: 120, height: 120,radius: 1000,)
          : UCircularImage(
              isNetworkImage: isProfileLogo,
              showBorder: true,
              borderWidth: 5,
              image: isProfileLogo
                  ? controller.user.value.profilePicture
                  : UImages.profileLogo,
              height: 120,
              width: 120,
            );
    });
  }
}
