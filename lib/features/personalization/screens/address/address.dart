import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/shimmer/addresses_shimmer.dart';
import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/features/personalization/screens/address/edit_address.dart';
import 'package:ecommerce_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(EditAddressScreen()),
        backgroundColor: UColors.primary,
        child: Icon(Iconsax.add, color: UColors.white),
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
        child: Obx(
          ()=> FutureBuilder(
            key: Key(controller.refreshData.value.toString()),
            future: controller.fetchAddress(),
            builder: (context, asyncSnapshot) {
              final loader = UAddressesShimmer();
              final widget = UCloudHelperFunctions.checkMultiRecordState(
                snapshot: asyncSnapshot,
                loader: loader
              );
              if (widget != null) return widget;
              final addresses = asyncSnapshot.data!;
              return ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    SizedBox(height: USizes.spaceBtwItems),
                itemCount: addresses.length,
                itemBuilder: (context, index) => SingleAddressTile(
                  onTap: () =>
                      controller.updateAddress(address: addresses[index]),
                  address: addresses[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
