import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/bottom_addto_cart.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/prdouct_thumnail_slider.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_meta_deta.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UProductThumbnailAndSlider(),

            ProductMetaData(),

            ProductAttributes(),

            SizedBox(height: USizes.spaceBtwItems),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
              child: Column(
                children: [
                  UElevatedButton(child: Text('Checkout'), func: () {}),
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

                    'hi my name is dhruv garg and i am wearing these shoes hi my name is dhruv garg and i am wearing these shoes hi my name is dhruv garg and i am wearing these shoes ',
                  ),
                ],
              ),
            ),

            SizedBox(height: USizes.spaceBtwItems),
          ],
        ),
      ),
      bottomNavigationBar: BottomAddToCart(),
    );
  }
}
