import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/features/shop/controllers/home/home_controller.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/banner_dots_navigation.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: CarouselSlider(
            carouselController: controller.controller,
            items: banners
                .map((banner) => URoundedImage(imageUrl: banner))
                .toList(),
            options: CarouselOptions(
              onPageChanged: (index, reason) => controller.changeValue(index),

              viewportFraction: 1,
            ),
          ),
        ),
        BannerDotsNavigation(),
      ],
    );
  }
}
