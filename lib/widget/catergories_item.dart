import 'package:flutter/material.dart';

class CategorieItem extends StatelessWidget {
  final String title;
  final String image;

  const CategorieItem({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(image, width: 56, height: 56),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
