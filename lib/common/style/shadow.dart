import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class UShadow {
  UShadow._();

  static List<BoxShadow> searchBarShadow = [
    BoxShadow(
      blurRadius: 2,
      spreadRadius: 4,
      color: UColors.black.withValues(alpha: 0.1),
    ),
  ];

  static List<BoxShadow> verticalProductShadow = [
    BoxShadow(
      blurRadius: 50,
      spreadRadius: 7,
      color: UColors.dark.withValues(alpha: 0.1),
      offset: Offset(0, 2),
    ),
  ];
}
