import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    controller.fetchAddress();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        USectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          padding: 0,
          func: () => controller.selectedNewAddress(context),
        ),
        SizedBox(height: USizes.spaceBtwItems),
        Obx(() {
          if(controller.selectedAddress.value.id.isEmpty) {
            return Text('No address selected');
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.selectedAddress.value.name, style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: USizes.spaceBtwItems / 2),
              Row(
                children: [
                  Icon(Iconsax.call),
                  SizedBox(width: USizes.spaceBtwItems / 2),
                  Text(controller.selectedAddress.value.phoneNumber),
                ],
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),
              Row(
                children: [
                  Icon(Icons.location_history),
                  SizedBox(width: USizes.spaceBtwItems / 2),
                  Expanded(
                    child: Text(
                     controller.selectedAddress.value.toString(),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ],
    );
  }
}
