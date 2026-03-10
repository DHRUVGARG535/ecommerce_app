import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/screens/address/address.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/widgets/profile_primary_header.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/widgets/settings_menu_tile.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/widgets/user_profile_tile.dart';
import 'package:ecommerce_app/features/shop/screens/order/order.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfilePrimaryHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: USizes.defaultSpace,
              ),
              child: Column(
                children: [
                  UserProfileTile(
                    title: 'Dhruv',
                    subTitle: 'dhruvgarg0903@gmai.com',
                  ),
                  SizedBox(height: USizes.spaceBtwItems),
                  Column(
                    children: [
                      USectionHeading(
                        title: 'Account Settings',
                        showViewAll: false,
                        padding: 0,
                      ),
                      SettingsMenuTile(
                        title: 'My Addresses',
                        subTitle: 'Set shopping delivery addresses',
                        icon: Iconsax.safe_home,
                        func: () => Get.to(AddressScreen()),
                      ),
                      SettingsMenuTile(
                        title: 'My Orders',
                        subTitle: 'Add, remove products and move to checkout',
                        icon: Iconsax.bag_tick,
                        func: () => Get.to(OrderScreen()),
                      ),
                      SettingsMenuTile(
                        title: 'My Cart',
                        subTitle: 'Add, remove products and move to checkout',
                        icon: Iconsax.shopping_cart,
                        func: () {},
                      ),

                      SizedBox(height: USizes.spaceBtwSections),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text('Log Out'),
                        ),
                      ),
                      SizedBox(height: USizes.spaceBtwSections),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
