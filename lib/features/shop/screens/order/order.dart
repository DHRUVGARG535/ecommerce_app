import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/features/shop/screens/order/widgets/order_tile.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: UPadding.screenPadding,
        child: ListView.separated(
          itemBuilder: (context, index) => OrderTile(),
          separatorBuilder: (context, index) =>
              SizedBox(height: USizes.spaceBtwItems),
          itemCount: 10,
        ),
      ),
    );
  }
}
