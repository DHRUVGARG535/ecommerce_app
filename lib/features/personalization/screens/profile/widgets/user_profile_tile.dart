import 'package:ecommerce_app/features/personalization/screens/edit_profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.icon = Iconsax.edit,
  });

  final String title;
  final String subTitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
      trailing: IconButton(
        onPressed: () => Get.to(EditProfileScreen()),
        icon: Icon(icon),
      ),
    );
  }
}
