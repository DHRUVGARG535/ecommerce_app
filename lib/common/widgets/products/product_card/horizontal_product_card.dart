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
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class UHorizontalProductCard extends StatelessWidget {
  const UHorizontalProductCard({super.key, required this.product});

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
      onTap: () => Get.to(ProductDetailsScreen(product: product)),
      child: Container(
        width: 280,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: dark ? UColors.darkerGrey : UColors.light,
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
        ),
        child: Row(
          children: [
            URoundedContainer(
              height: 120,
              width: 120,
              padding: EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.light,
              radius: USizes.productImageRadius,
      
              child: Stack(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: URoundedImage(imageUrl: product.thumbnail,isNetworkImage: true,),
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
                            "$discount%",
                            style: Theme.of(
                              context,
                            ).textTheme.labelLarge!.apply(color: UColors.black),
                          ),
                        ),
                      ),
                    ),
      
                  Positioned(
                    right: 0,
                    child: UFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 156.0,
              child: Padding(
                padding: const EdgeInsets.only(left: USizes.sm, top: USizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: UProductTitleText(
                        smallSize: false,
                        title: product.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    UBrandTitleVerify(
                      title: product.brand!.name,
                      maxLines: 1,
                      iconColor: dark ? UColors.white : null,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
                      children: [
                        Flexible(
                          child: UProductPriceText(
                            price: product.salePrice != 0
                                ? product.salePrice.toString()
                                : product.price.toString(),
                            isLarge: true,
                          ),
                        ),
      
                       ProductAddToCartButton(product: product)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
