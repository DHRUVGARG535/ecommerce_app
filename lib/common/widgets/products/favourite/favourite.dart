import 'package:ecommerce_app/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_app/features/shop/controllers/favourite/favourite_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

class UFavouriteIcon extends StatelessWidget {
  const UFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(
      ()=>UCircularIcon(
        onPressed: () => controller.toogleFavouriteIcon(productId),
        height: USizes.iconLg + 4,
        width: USizes.iconLg + 4,
        size: 20,
        icon: controller.isFavourite(productId)?Iconsax.heart5:Iconsax.heart,
        color:controller.isFavourite(productId)? Colors.red:null,
      ),
    );
  }
}
