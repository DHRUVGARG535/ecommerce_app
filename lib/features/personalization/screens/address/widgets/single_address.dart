import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SingleAddressTile extends StatelessWidget {
  const SingleAddressTile({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      backgroundColor: isSelected
          ? UColors.primary.withValues(alpha: 0.5)
          : null,
          
      showBorder:isSelected?false: true,
      radius: USizes.md,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(USizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dhruv Garg',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: USizes.spaceBtwItems/2),
                Text(
                  '+918218068160',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: USizes.spaceBtwItems/2),
                Text('14/A Krishan nagar, Dehradun, India'),
              ],
            ),
          ),
          if(isSelected) Positioned(
            bottom: 0,
            top: 0,
            right: 12,
            child: Icon(Icons.check_circle),
          ),
        ],
      ),
    );
  }
}
