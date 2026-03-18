import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/bottom_addto_cart.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/prdouct_thumnail_slider.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_meta_deta.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            UProductThumbnailAndSlider(product: product),

            ProductMetaData(product: product),

            if (product.productAttributes != null &&
                product.productAttributes!.isNotEmpty)
              ProductAttributes(product: product),

            SizedBox(height: USizes.spaceBtwItems),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
              child: Column(
                children: [
                  UElevatedButton(
                    child: Text('Checkout'),
                    func: () => CartController.instance.directCheckout(product),
                  ),
                  SizedBox(height: USizes.spaceBtwItems),

                  USectionHeading(
                    title: 'Description',
                    showViewAll: false,
                    padding: 0,
                  ),
                  ReadMoreText(
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),

                    product.description ?? '',
                  ),
                ],
              ),
            ),

            SizedBox(height: USizes.spaceBtwItems),
          ],
        ),
      ),
      bottomNavigationBar: BottomAddToCart(product: product),
    );
  }
}
