import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/features/shop/controllers/promocode/promocode_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Promocode extends StatelessWidget {
  const Promocode({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PromocodeController.instance;
    return URoundedContainer(
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(USizes.sm),
      showBorder: true,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                controller.promocode.value = value;
              },
              decoration: InputDecoration(
                border: InputBorder.none,

                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Have a promocode ?',
              ),
            ),
          ),

          SizedBox(
            width: 80,

            child: Obx(
              () => ElevatedButton(
                style: ElevatedButton.styleFrom(side: BorderSide.none),
                onPressed: controller.appliedPromocode.value.id.isNotEmpty
                    ? null
                    : controller.promocode.value.isEmpty
                    ? null
                    : controller.applyPromocode,
                child: controller.isLoading.value
                    ? CircularProgressIndicator(color: UColors.white)
                    : Text(
                        controller.appliedPromocode.value.id.isNotEmpty
                            ? 'Applied'
                            : 'Apply',
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
