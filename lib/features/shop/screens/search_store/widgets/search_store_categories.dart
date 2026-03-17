import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/category/category_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchStoreCategories extends StatelessWidget {
  const SearchStoreCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    List<CategoryModel> categories = controller.allCategories;
    return Column(
      children: [
        USectionHeading(title: "Categories", padding: 0, showViewAll: false),
        SizedBox(height: USizes.spaceBtwItems / 2),
        ListView.builder(
          
          itemCount: categories.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ListTile(
             onTap: () => Get.to(
                AllProductsScreen(
                  title: categories[index].name,
                  futureMethod: controller.getProductCategory(
                    categories[index].id,
                  ),
                ),
              ),
            contentPadding: EdgeInsets.zero,
            title: Text(categories[index].name),
            leading: URoundedImage(
              imageUrl: categories[index].image,
              isNetworkImage: true,
             
              borderRadius: 0,
              width: USizes.iconLg,
              height: USizes.iconLg,
            ),
          ),
        ),
      ],
    );
  }
}
