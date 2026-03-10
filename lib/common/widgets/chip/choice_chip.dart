import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UChoiceChip extends StatelessWidget {
  const UChoiceChip({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onSelected,
  });

  final String text;
  final bool isSelected;
  final void Function(bool?) onSelected;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final isColor = UHelperFunctions.getColor(text) != null;
    return ChoiceChip(
      backgroundColor: isColor
          ? UHelperFunctions.getColor(text)
          : dark?UColors.darkGrey: UColors.white,

      selectedColor: isColor ? UHelperFunctions.getColor(text) : null,
      label: isColor ? SizedBox() : Text(text),
      labelPadding: isColor ? EdgeInsets.zero : null,
      avatar: isColor
          ? URoundedContainer(
              height: 50,
              width: 50,
              backgroundColor: UHelperFunctions.getColor(text),
            )
          : null,
      selected: isSelected,
      onSelected: onSelected,
      padding: isColor ? EdgeInsets.zero : null,
      shape: isColor ? CircleBorder() : null,
      labelStyle: TextStyle(color: isSelected ? Colors.white : null),
    );
  }
}
