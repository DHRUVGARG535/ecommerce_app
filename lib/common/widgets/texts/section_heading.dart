import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class USectionHeading extends StatelessWidget {
  const USectionHeading({
    super.key,
    this.func,
    required this.title,
    this.color,
    this.showViewAll = true,
    this.buttonTitle = 'View all',
    this.padding = USizes.defaultSpace,
  });
  final bool showViewAll;
  final VoidCallback? func;
  final String title;
  final Color? color;
  final String buttonTitle;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showViewAll)
            TextButton(onPressed: func, child: Text(buttonTitle)),
        ],
      ),
    );
  }
}
