import 'package:ecommerce_app/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce_app/features/shop/screens/home/home.dart';
import 'package:ecommerce_app/features/shop/screens/store/store.dart';
import 'package:ecommerce_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationMenuController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          selectedIndex: controller.index.value,
          onDestinationSelected: (value) => controller.index.value = value,
          backgroundColor: UHelperFunctions.isDarkMode(context)
              ? UColors.dark
              : UColors.light,
          indicatorColor: UHelperFunctions.isDarkMode(context)
              ? UColors.light.withAlpha(20)
              : UColors.dark.withAlpha(20),
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.index.value]),
    );
  }
}

class NavigationMenuController extends GetxController {
  static NavigationMenuController get instance => Get.find();

  RxInt index = 0.obs;

  List<Widget> screens = [
    HomeScreen(),
    ShopScreen(),
    Wishlist(),
    ProfileScreen(),
  ];
}
