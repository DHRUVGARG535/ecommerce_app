import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        USectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          padding: 0,
        ),
        SizedBox(height: USizes.spaceBtwItems),
        Text('Dhruv Garg', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: USizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Iconsax.call),
            SizedBox(width: USizes.spaceBtwItems / 2),
            Text('+918218068610'),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.location_history),
            SizedBox(width: USizes.spaceBtwItems / 2),
            Expanded(
              child: Text(
                'House No.295, Krishan nagar,Dehradun, India',
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
