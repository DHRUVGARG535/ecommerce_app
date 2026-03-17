import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReauthenticateUser extends StatelessWidget {
  const ReauthenticateUser({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: UAppBar(
        leadingIcon: Icons.arrow_back,
        
        title: Text(
          'Verify User',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: controller.reAuthFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: UValidator.validateEmail,
                      controller: controller.email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: UTexts.email,
                      ),
                    ),
                    SizedBox(height: USizes.spaceBtwInputFields),
                    Obx(
                      ()=> TextFormField(
                        validator: (value) =>
                            UValidator.validateEmptyText('Password', value),
                        controller: controller.password,
                        obscureText: controller.isPasswordVisible.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: UTexts.password,
                          suffixIcon: IconButton(
                            onPressed: controller.isPasswordVisible.toggle,
                            icon: Icon(!controller.isPasswordVisible.value?Iconsax.eye_slash:Iconsax.eye),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: USizes.spaceBtwSections),
                    UElevatedButton(func: controller.reauthenticateUser, child: Text('Verify')),
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
