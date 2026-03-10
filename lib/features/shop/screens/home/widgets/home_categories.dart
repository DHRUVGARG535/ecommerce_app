import 'package:ecommerce_app/common/widgets/image_text/vertical_image_text.dart';
import 'package:ecommerce_app/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: USizes.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            UTexts.popularCategories,
            style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white),
          ),
          SizedBox(height: USizes.spaceBtwItems),
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, idx) => VerticalImageText(
                func: ()=>Get.to(SubCategories()),
                title: 'Sports Categories',
                image: UImages.sportsIcon,
                textColor: UColors.light,
               
              ),
              separatorBuilder: (context, idx) =>
                  SizedBox(width: USizes.spaceBtwItems),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
