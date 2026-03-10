import 'package:ecommerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class UElevatedButton extends StatelessWidget {
  const UElevatedButton({super.key, required this.child, required this.func});

  final Widget child;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UDeviceHelper.getScreenWidth(context),
      child: ElevatedButton(onPressed: func, child: child),
    );
  }
}
