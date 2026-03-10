import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: UAppBar(
        title: Text('Wishlist'),
        actions: [
          IconButton(
            onPressed: () => NavigationMenuController.instance.index.value = 0,
            icon: Icon(Iconsax.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: UGridLayout(
            
            itemCout: 10,
            itemBuilder: (context, index) => VerticalProductCard(),
          ),
        ),
      ),
    );
  }
}
