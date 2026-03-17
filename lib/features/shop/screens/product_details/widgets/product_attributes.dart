import 'package:ecommerce_app/common/widgets/chip/choice_chip.dart';
import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/product/variaton_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariatonController());
    final dark = UHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (controller.selectedVariation.value.id.isNotEmpty)
              URoundedContainer(
                padding: EdgeInsets.symmetric(
                  vertical: USizes.sm,
                  horizontal: USizes.md,
                ),
                radius: USizes.sm,
                backgroundColor: dark ? UColors.darkerGrey : UColors.grey,
                showBorder: false,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        USectionHeading(
                          title: 'Variation',
                          showViewAll: false,
                          padding: 0,
                        ),
                        SizedBox(width: USizes.spaceBtwItems),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Price'),
                                SizedBox(width: USizes.spaceBtwItems / 4),
                                if (controller
                                        .selectedVariation
                                        .value
                                        .salePrice >
                                    0)
                                  UProductPriceText(
                                    price: controller
                                        .selectedVariation
                                        .value
                                        .price
                                        .toStringAsFixed(0),
                                    lineThrough: true,
                                  ),
                                SizedBox(width: USizes.spaceBtwItems / 4),
                                UProductPriceText(
                                  price: controller.getVariationPrice(),
                                  isLarge: true,
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Text('Stock'),
                                SizedBox(width: USizes.sm),
                                Text(
                                 controller.variatonStockStatus.value,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: USizes.spaceBtwItems / 4),

                    UProductTitleText(
                      title: controller.selectedVariation.value.description??'',
                      smallSize: true,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),

            SizedBox(height: USizes.spaceBtwItems / 2),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!
                  .map(
                    (attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        USectionHeading(
                          title: attribute.name ?? '',
                          showViewAll: false,
                          padding: 0,
                        ),
                        SizedBox(height: USizes.spaceBtwItems / 4),

                        Obx(
                          () => Wrap(
                            spacing: USizes.sm,
                            children: attribute.values!.map((attributesValue) {
                              bool isSelected =
                                  controller.selectedAttributes[attribute
                                      .name] ==
                                  attributesValue;
                              bool available = controller
                                  .getAttributeAvailabilityInVariaton(
                                    product.productVariations!,
                                    attribute.name!,
                                  )
                                  .contains(attributesValue);
                              return UChoiceChip(
                                text: attributesValue,
                                isSelected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (available && selected) {
                                          controller.onAttributeSelected(
                                            product,
                                            attribute.name,
                                            attributesValue,
                                          );
                                        }
                                      }
                                    : null,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
