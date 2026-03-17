import 'package:ecommerce_app/common/widgets/image_text/vertical_image_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/brands/brands_controller.dart';
import 'package:ecommerce_app/features/shop/screens/brands/brand_products.dart';
import 'package:ecommerce_app/features/shop/screens/brands/brands_screen.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class SearchStoreBrands extends StatelessWidget {
  const SearchStoreBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BrandsController());
    return Obx(() {
      if (controller.isBrandLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      if (controller.brands.isEmpty) return Text('No Brands Found!');

      final allBrands = controller.brands.take(10). toList();

      return Column(
        children: [
          USectionHeading(
            title: "Brands",
            padding: 0,
            func: () => Get.to(BrandsScreen()),
          ),

          Wrap(
            spacing: 7.8,
            runSpacing: 8,
            children: allBrands
                .map(
                  (brand) => VerticalImageText(
                    func: () => Get.to(BrandProducts(title: brand.name, brand: brand)),
                    title: brand.name,
                    image: brand.image,
                    textColor: UHelperFunctions.isDarkMode(context)
                        ? UColors.white
                        : UColors.black,
                  ),
                )
                .toList(),
          ),
        ],
      );
    });
  }
}
