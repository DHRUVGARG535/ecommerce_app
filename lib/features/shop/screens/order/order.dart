import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_app/features/shop/controllers/order/order_controller.dart';
import 'package:ecommerce_app/features/shop/screens/order/widgets/order_tile.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/images.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    return Scaffold(
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: UPadding.screenPadding,
        child: FutureBuilder(
          future: controller.getAllOrders(),
          builder: (context, snapshot) {
            final nothignLoader = UAnimationLoader(
              actionText: "Let's fill it",
              onActionPressed: () => Get.offAll(NavigationMenu()),
              text: 'No orders yet',
              animation: UImages.pencilAnimation,
              showActionButton: true,
            );

            final widget = UCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot,
              nothingFound: nothignLoader,
            );
            if (widget != null) return widget;

            return ListView.separated(
              itemBuilder: (context, index) =>
                  OrderTile(order: snapshot.data![index]),
              separatorBuilder: (context, index) =>
                  SizedBox(height: USizes.spaceBtwItems),
              itemCount: snapshot.data!.length,
            );
          },
        ),
      ),
    );
  }
}
