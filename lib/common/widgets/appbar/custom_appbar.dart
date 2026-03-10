import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

class UAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UAppBar({
    super.key,
    this.leadingIcon,
    this.title,

    this.showBackLeading = false,
    this.func,
    this.actions,
    this.padding = USizes.md,
  });

  final IconData? leadingIcon;
  final Widget? title;
  final double padding;
  final bool showBackLeading;
  final List<Widget>? actions;
  final VoidCallback? func;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: AppBar(
        actions: actions,
        automaticallyImplyLeading: false,
        title: title,
        leading: showBackLeading
            ? IconButton(onPressed: Get.back, icon: Icon(Iconsax.direct_left))
            : leadingIcon != null
            ? IconButton(onPressed: () => Get.back(), icon: Icon(leadingIcon))
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UDeviceHelper.getAppBarHeight());
}
