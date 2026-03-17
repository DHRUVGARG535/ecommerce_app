import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/features/personalization/controllers/change_name_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        title: Text(
          'Update Name',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Update your name to keep your profile accurate and personlized',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: USizes.spaceBtwSections),
              Form(
                key: controller.updateNameKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) =>
                          UValidator.validateEmptyText('First Name', value),
                      controller: controller.firstName,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: UTexts.firstName,
                      ),
                    ),
                    SizedBox(height: USizes.spaceBtwInputFields),
                    TextFormField(
                      validator: (value) =>
                          UValidator.validateEmptyText('Last Name', value),
                      controller: controller.lastName,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: UTexts.lastName,
                      ),
                    ),
                    SizedBox(height: USizes.spaceBtwSections),
                    UElevatedButton(
                      func: controller.updateName,
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
