import 'package:ecommerce_app/common/widgets/image_text/vertical_image_text.dart';
import 'package:ecommerce_app/common/widgets/shimmer/category_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/category/category_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: USizes.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            UTexts.popularCategories,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.apply(color: UColors.white),
          ),
          SizedBox(height: USizes.spaceBtwItems),
          Obx(() {
            final categories = controller.featuredCategories;
            if (controller.isCategoriesLoading.value) {
              return UCategoryShimmer(itemCount: categories.length);
            }
            if (categories.isEmpty) {
              return Text('Categories not found');
            }

            return SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, idx) {
                  CategoryModel category = categories[idx];
                  return VerticalImageText(
                    func: () => Get.to(SubCategories(category: category,)),
                    title: category.name,
                    image: category.image,
                    textColor: UColors.light,
                  );
                },
                separatorBuilder: (context, idx) =>
                    SizedBox(width: USizes.spaceBtwItems),
                itemCount: categories.length,
              ),
            );
          }),
        ],
      ),
    );
  }
}
