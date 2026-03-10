import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/products/product_card/horizontal_product_card.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text(
          'Sports',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),

      body: Padding(
        padding: UPadding.screenPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              USectionHeading(title: 'Sport Shoes', padding: 0),
                 SizedBox(height: USizes.spaceBtwItems/2),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => UHorizontalProductCard(),
                  separatorBuilder: (context, index) =>
                      SizedBox(width: USizes.spaceBtwItems),
                  itemCount: 10,
                ),
              ),
              USectionHeading(title: 'Sport Shoes', padding: 0),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => UHorizontalProductCard(),
                  separatorBuilder: (context, index) =>
                      SizedBox(width: USizes.spaceBtwItems),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
