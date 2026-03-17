import 'package:ecommerce_app/common/style/shadow.dart';
import 'package:ecommerce_app/common/widgets/buttons/add_to_cart_button.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/products/favourite/favourite.dart';
import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_verify.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/product_details.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final String? discount = controller.discountCalculate(
      product.price,
      product.salePrice,
    );
    final dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(ProductDetailsScreen(product: product,)),
      child: Container(
        height: 197,

        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
          color: dark ? UColors.dark : UColors.light,
          boxShadow: UShadow.verticalProductShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            URoundedContainer(
              width: 180,
              padding: EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.white,
              child: Stack(
                children: [
                  Center(
                    child: URoundedImage(
                      imageUrl: product.thumbnail,
                      isNetworkImage: true,
                      height: 120,
                    ),
                  ),
                  if (discount != null)
                    Positioned(
                      top: 12,
                      child: URoundedContainer(
                        height: 20,
                        width: 36,

                        radius: USizes.cardRadiusXs,
                        backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                        child: Center(
                          child: Text(
                            '$discount%',
                            style: Theme.of(
                              context,
                            ).textTheme.labelLarge!.apply(color: UColors.black),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    right: 0,
                    child: UFavouriteIcon(productId: product.id,)
                  ),
                ],
              ),
            ),

            SizedBox(height: USizes.spaceBtwItems),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UProductTitleText(smallSize: true, title: product.title),
                  SizedBox(height: USizes.spaceBtwItems / 2),
                  //brand name and logo
                  UBrandTitleVerify(title: product.brand!.name),
                ],
              ),
            ),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: USizes.xs),
                  child: UProductPriceText(
                    price: controller.getPrice(product),
                    isLarge: false,
                  ),
                ),
               ProductAddToCartButton(product: product,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
