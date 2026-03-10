import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UFormDivider extends StatelessWidget {
  const UFormDivider({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            indent: 60,
            endIndent: 5,
            color: UHelperFunctions.isDarkMode(context)
                ? UColors.darkGrey
                : UColors.grey,
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Expanded(
          child: Divider(
            indent: 5,
            endIndent: 60,
            color: UHelperFunctions.isDarkMode(context)
                ? UColors.darkGrey
                : UColors.grey,
          ),
        ),
      ],
    );
  }
}
