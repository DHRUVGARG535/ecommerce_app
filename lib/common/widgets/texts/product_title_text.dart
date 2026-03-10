import 'package:flutter/material.dart';

class UProductTitleText extends StatelessWidget {
  const UProductTitleText({
    super.key,
    required this.smallSize,
    required this.title,
    this.maxLines = 2,
    this.textAlign,
    this.overflow,
  });

  final bool smallSize;
  final String title;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      title,
      maxLines: maxLines,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      textAlign: textAlign,
    );
  }
}
