import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileDetailsRow extends StatelessWidget {
  const EditProfileDetailsRow({
    super.key,
    required this.title,
    required this.subTitle,
    this.icon = Iconsax.arrow_right_34,
  });

  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(title, style: Theme.of(context).textTheme.bodySmall),
        ),
        Expanded(
          flex: 4,
          child: Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(child: Icon(icon, size: USizes.iconSm)),
      ],
    );
  }
}
