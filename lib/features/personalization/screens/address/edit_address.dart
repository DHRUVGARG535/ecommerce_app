import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text(
          'Add new Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: UPadding.screenPadding,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text('Name'),
                prefixIcon: Icon(Iconsax.user),
              ),
            ),
            SizedBox(height: USizes.spaceBtwInputFields),
            TextFormField(
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
                    decoration: InputDecoration(
                      label: Text('Street'),
                      prefixIcon: Icon(Iconsax.building_31),
                    ),
                  ),
                ),
                SizedBox(width: USizes.spaceBtwInputFields),

                Expanded(
                  child: TextFormField(
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
                    decoration: InputDecoration(
                      label: Text('City'),
                      prefixIcon: Icon(Iconsax.building),
                    ),
                  ),
                ),
                SizedBox(width: USizes.spaceBtwInputFields),

                Expanded(
                  child: TextFormField(
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
              decoration: InputDecoration(
                label: Text('Country'),
                prefixIcon: Icon(Iconsax.global),
              ),
            ),

            SizedBox(height: USizes.spaceBtwSections),
            UElevatedButton(child: Text('Save'), func: () {}),
          ],
        ),
      ),
    );
  }
}
