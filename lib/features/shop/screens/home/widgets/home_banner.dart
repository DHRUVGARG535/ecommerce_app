import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommerce_app/features/shop/controllers/banners/banner_controller.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/banner_dots_navigation.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  //                banners
  //                 .map((banner) => URoundedImage(imageUrl: banner))
  //                 .toList(),
  @override
  Widget build(BuildContext context) {
    final bannersController = Get.put(BannerController());
  
    final banner = bannersController.banners;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Obx(() {

            if(bannersController.isBannerLoading.value) {
              return UShimmerEffect(width: double.infinity, height: 190);
            }
            if(bannersController.banners.isEmpty) {
              return Text("Banners not found");
            }
            return CarouselSlider(
              
              carouselController: bannersController.controller,
              items: banner
                  .map(
                    (banner) => URoundedImage(
                      onPressed: ()=>Get.toNamed(banner.targetScreen),
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                
                onPageChanged: (index, reason) => bannersController.changeValue(index),

                viewportFraction: 1,
              ),
            );
          }),
        ),
        BannerDotsNavigation(),
      ],
    );
  }
}
