import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  RxString selectedImage = ''.obs;

  List<String> getAllImages(ProductModel product) {
    Set<String> images = {};

    images.add(product.thumbnail);

    selectedImage.value = product.thumbnail;

    if (product.images != null && product.images!.isNotEmpty) {
      images.addAll(product.images!);
    }

    if (product.productVariations != null && product.images!.isNotEmpty) {
      final allImages = product.productVariations!
          .map((variaton) => variaton.image)
          .toList();

      images.addAll(allImages);
    }

    return images.toList();
  }

  void showEnlargeImage(String imageUrl) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: USizes.defaultSpace,
                vertical: USizes.defaultSpace * 2,
              ),
              child: CachedNetworkImage(imageUrl: imageUrl),
            ),
            SizedBox(height: USizes.spaceBtwSections),
            Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: Text('Close'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
