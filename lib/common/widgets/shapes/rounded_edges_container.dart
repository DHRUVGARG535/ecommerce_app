import 'package:ecommerce_app/common/widgets/shapes/clipper/custom_rounded_clipper.dart';
import 'package:flutter/material.dart';

class URounedEdges extends StatelessWidget {
  const URounedEdges({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: UCustomRoundEdges(), child: child);
  }
}
