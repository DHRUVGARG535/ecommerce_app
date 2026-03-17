import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/products/favourite/favourite.dart';
import 'package:ecommerce_app/features/shop/controllers/product/image_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart' show UColors;
import '../../../../../utils/helpers/helper_functions.dart';

class UProductThumbnailAndSlider extends StatelessWidget {
  const UProductThumbnailAndSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    List<String> images = controller.getAllImages(product);
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      color: dark ? UColors.dark : UColors.light,
      child: Stack(
        children: [
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(USizes.productImageRadius * 2),
              child: Center(
                child: Obx(() {
                  final image = controller.selectedImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargeImage(image),
                    child: CachedNetworkImage(
                      imageUrl: controller.selectedImage.value,
                      progressIndicatorBuilder: (context, url, progress) =>
                          CircularProgressIndicator(
                            color: UColors.primary,
                            value: progress.progress,
                          ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            left: USizes.defaultSpace,
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 80,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Obx(() {
                    bool isSelected =
                        controller.selectedImage.value == images[index];
                    return URoundedImage(
                      onPressed: () =>
                          controller.selectedImage.value = images[index],
                      isNetworkImage: true,
                      applyImageRadius: true,
                      borderRadius: USizes.md,
                      backgroundColor: dark ? UColors.dark : UColors.white,
                      width: 80,
                      padding: EdgeInsets.all(USizes.sm),
                      boxBorder: Border.all(
                        color: isSelected
                            ? UColors.primary
                            : Colors.transparent,
                      ),
                      imageUrl: images[index],
                    );
                  });
                },

                separatorBuilder: (context, index) =>
                    SizedBox(width: USizes.spaceBtwItems),
                itemCount: images.length,
              ),
            ),
          ),

          UAppBar(
            leadingIcon: Icons.arrow_back,
            actions: [UFavouriteIcon(productId: '')],
          ),
        ],
      ),
    );
  }
}
