import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/features/personalization/screens/address/edit_address.dart';
import 'package:ecommerce_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(EditAddressScreen()),
        backgroundColor: UColors.primary,
        child: Icon(Iconsax.add,color: UColors.white,),
      ),
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: Column(
          children: [
            SingleAddressTile(isSelected: true),
            SizedBox(height: USizes.spaceBtwItems),
            SingleAddressTile(isSelected: false),
            SizedBox(height: USizes.spaceBtwItems),
            SingleAddressTile(isSelected: false),
          ],
        ),
      ),
    );
  }
}
