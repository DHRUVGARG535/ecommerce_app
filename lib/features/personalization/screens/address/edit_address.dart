import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text(
          'Add new Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) =>
                      UValidator.validateEmptyText('Name', value),
                  decoration: InputDecoration(
                    label: Text('Name'),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
                SizedBox(height: USizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: UValidator.validatePhoneNumber,
                  decoration: InputDecoration(
                    
                    label: Text('Phone number'),
                    prefixIcon: Icon(Iconsax.call),
                  ),
                ),
                SizedBox(height: USizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                         validator: (value) =>
                      UValidator.validateEmptyText('Street', value),
                        decoration: InputDecoration(
                          label: Text('Street'),
                          prefixIcon: Icon(Iconsax.building_31),
                        ),
                      ),
                    ),
                    SizedBox(width: USizes.spaceBtwInputFields),
        
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                         validator: (value) =>
                      UValidator.validateEmptyText('Postal Code', value),
                        decoration: InputDecoration(
                          label: Text('Postal Code'),
                          prefixIcon: Icon(Iconsax.code),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: USizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                         validator: (value) =>
                      UValidator.validateEmptyText('City', value),
                        decoration: InputDecoration(
                          label: Text('City'),
                          prefixIcon: Icon(Iconsax.building),
                        ),
                      ),
                    ),
                    SizedBox(width: USizes.spaceBtwInputFields),
        
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                         validator: (value) =>
                      UValidator.validateEmptyText('State', value),
                        decoration: InputDecoration(
                          
                          label: Text('State'),
                          prefixIcon: Icon(Iconsax.activity),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: USizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.country,
                   validator: (value) =>
                      UValidator.validateEmptyText('Country', value),
                  decoration: InputDecoration(
                    label: Text('Country'),
                    prefixIcon: Icon(Iconsax.global),
                  ),
                ),
        
                SizedBox(height: USizes.spaceBtwSections),
                UElevatedButton(func:controller.addNewAddress, child: Text('Save')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
