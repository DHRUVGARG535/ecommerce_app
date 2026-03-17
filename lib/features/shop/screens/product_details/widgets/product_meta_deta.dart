import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_verify.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final String? discount = controller.discountCalculate(
      product.price,
      product.salePrice,
    );
    final String productPrice = controller.getPrice(product);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (discount != null) ...[
                URoundedContainer(
                  height: 20,
                  width: 44,

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
                SizedBox(width: USizes.spaceBtwItems),
              ],
              if (product.salePrice > 0 &&
                  product.productType == ProductType.single.toString()) ...[
                UProductPriceText(
                  price: product.price.toString(),
                  lineThrough: true,
                ),
                SizedBox(width: USizes.spaceBtwItems),
              ],

              UProductPriceText(
                price: productPrice,
                lineThrough: false,
                isLarge: true,
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            ],
          ),
          SizedBox(height: USizes.sm),
          UProductTitleText(smallSize: false, title: product.title),
          SizedBox(height: USizes.sm),
          Row(
            children: [
              UProductTitleText(smallSize: false, title: 'Status'),
              SizedBox(width: USizes.sm),
              Text(
                controller.isInStock(product.stock),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          SizedBox(height: USizes.spaceBtwItems / 2),

          Row(
            children: [
              SizedBox(
                height: 56,
                child: CachedNetworkImage(
                  imageUrl: product.brand != null ? product.brand!.image : '',
                ),
              ),
              SizedBox(width: USizes.spaceBtwItems / 2),
              UBrandTitleVerify(
                title: product.brand != null ? product.brand!.name : "",
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),
            ],
          ),
          SizedBox(height: USizes.spaceBtwItems / 2),
        ],
      ),
    );
  }
}
