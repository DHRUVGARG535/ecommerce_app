import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class UFormDivider extends StatelessWidget {
  const UFormDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: true, onChanged: (value) {}),
            Text(UTexts.rememberMe),
          ],
        ),
        TextButton(onPressed: () {}, child: Text(UTexts.forgetPassword)),
      ],
    );
  }
}
