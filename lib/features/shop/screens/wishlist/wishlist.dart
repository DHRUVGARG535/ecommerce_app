import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_app/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/favourite/favourite_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
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
          padding: const EdgeInsets.only(top: 8.0),
          child: Obx(
            () => FutureBuilder(
              future: controller.getFavouriteProducts(),
              builder: (context, asyncSnapshot) {
                final nothingFound = UAnimationLoader(
                  animation: UImages.pencilAnimation,
                  showActionButton: true,
                  actionText: "Let's add some",
                  text: 'Wishlist is empty....',
                  onActionPressed: () =>
                      NavigationMenuController.instance.index.value = 0,
                );
                final loader = UVerticalProductShimmer();
                final widget = UCloudHelperFunctions.checkMultiRecordState(
                  nothingFound: nothingFound,
                  snapshot: asyncSnapshot,
                  loader: loader,
                );
                if (widget != null) return widget;

                List<ProductModel> products = asyncSnapshot.data!;
                return UGridLayout(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return VerticalProductCard(product: products[index]);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
