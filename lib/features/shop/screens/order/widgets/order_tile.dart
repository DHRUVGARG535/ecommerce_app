import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/features/shop/models/order_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return URoundedContainer(
      padding: EdgeInsets.all(USizes.md),
      showBorder: false,
      backgroundColor: dark ? UColors.dark : UColors.light,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Iconsax.ship),
              SizedBox(width: USizes.spaceBtwItems),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.orderStatusText,
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: UColors.primary,
                      fontSizeFactor: 1,
                    ),
                  ),
                  Text(
                    order.formattedOrderDate,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Iconsax.arrow_right_34)),
            ],
          ),
          SizedBox(height: USizes.spaceBtwItems),
          Row(
            children: [
              Row(
                children: [
                  Icon(Iconsax.tag),
                  SizedBox(width: USizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order ID',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        order.id,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Icon(Iconsax.calendar_25),
                  SizedBox(width: USizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        order.formattedDeliveryDate,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
