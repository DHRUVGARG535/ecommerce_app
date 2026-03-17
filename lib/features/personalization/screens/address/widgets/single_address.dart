import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/features/personalization/models/address_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SingleAddressTile extends StatelessWidget {
  const SingleAddressTile({
    super.key,

    required this.address,
    required this.onTap,
  });

  final VoidCallback onTap;
  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
   
    return GestureDetector(
      onTap: onTap,
      child: Obx(() {
        String selectedAddressId = controller.selectedAddress.value.id;
        bool isSelected = selectedAddressId == address.id;
        return URoundedContainer(
          backgroundColor: isSelected
              ? UColors.primary.withValues(alpha: 0.5)
              : null,

          showBorder: isSelected ? false : true,
          radius: USizes.md,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(USizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: USizes.spaceBtwItems / 2),
                    Text(
                      address.phoneNumber,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: USizes.spaceBtwItems / 2),
                    Text(address.toString()),
                  ],
                ),
              ),
              if (isSelected)
                Positioned(
                  bottom: 0,
                  top: 0,
                  right: 12,
                  child: Icon(Icons.check_circle),
                ),
            ],
          ),
        );
      }),
    );
  }
}
