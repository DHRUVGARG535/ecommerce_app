import 'package:ecommerce_app/common/widgets/buttons/uelevated_button.dart';
import 'package:ecommerce_app/features/authentication/controllers/sign_up/signup_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/signup_checkbox.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Form(
      key: controller.singUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      UValidator.validateEmptyText('First Name', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    label: Text(UTexts.firstName),
                  ),
                ),
              ),
              SizedBox(width: USizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      UValidator.validateEmptyText('Last Name', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    label: Text(UTexts.lastName),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: USizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            validator: (value) => UValidator.validateEmail(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              label: Text(UTexts.email),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.phonenumber,
            validator: (value) => UValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              label: Text(UTexts.phoneNumber),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),
          Obx(
            ()=> TextFormField(
              controller: controller.password,
              obscureText: controller.isPaswordVisible.value,
              validator: (value) => UValidator.validatePassword(value),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: ()=>controller.isPaswordVisible.toggle(),
                  icon: Icon(
                    controller.isPaswordVisible.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                  ),
                ),
                label: Text(UTexts.password),
              ),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),
          SignupCheckbox(),
          SizedBox(height: USizes.spaceBtwItems),
          UElevatedButton(
            func: controller.registerUser,
            child: Text(UTexts.createAccount),
          ),
        ],
      ),
    );
  }
}
