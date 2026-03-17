import 'package:ecommerce_app/features/shop/controllers/banners/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerDotsNavigation extends StatelessWidget {
  const BannerDotsNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerController= BannerController.instance;
    
    return Obx(
      ()=> SmoothPageIndicator(
        
        effect: ExpandingDotsEffect(dotHeight: 6.0),
        controller: PageController(initialPage: bannerController.index.value),
        count: bannerController.banners.length, 
      ),
    );
  }
}
