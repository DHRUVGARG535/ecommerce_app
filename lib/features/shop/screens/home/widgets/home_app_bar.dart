import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/products/cart/cart.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Padding(
      padding: const EdgeInsets.only(top: USizes.md),
      child: UAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              UHelperFunctions.getGreetingMessage(),
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: UColors.grey),
            ),
            SizedBox(height: USizes.spaceBtwItems/3,),
            Obx(() {
              return controller.profileLoading.value
                  ? UShimmerEffect(width: 80, height: 15)
                  : Text(
                      controller.user.value.fullName,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: UColors.white),
                    );
            }),
          ],
        ),

        actions: [UCartCounter()],
      ),
    );
  }
}
