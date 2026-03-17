import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/images/user_profile_logo.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/features/personalization/screens/change_name/change_name.dart';
import 'package:ecommerce_app/features/personalization/screens/edit_profile/widgets/edit_profile_details.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: UAppBar(
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leadingIcon: Icons.arrow_back,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              Stack(
                children: [
                  Center(child: UserProfileLogo()),
                  Obx(() {
                    return controller.isProfileUploading.value
                        ? SizedBox()
                        : Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: UCircularIcon(
                                icon: Iconsax.edit,
                                onPressed: controller.updateUserProiflePicture,
                              ),
                            ),
                          );
                  }),
                ],
              ),
              SizedBox(height: USizes.spaceBtwItems),
              Divider(),

              SizedBox(height: USizes.spaceBtwItems * 1.5),
              USectionHeading(
                title: 'Account Settings',
                showViewAll: false,
                padding: 0,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              EditProfileDetailsRow(
                title: 'Name',
                subTitle: controller.user.value.fullName,
                func: () => Get.to(ChangeName()),
              ),

              EditProfileDetailsRow(
                title: 'Username',
                subTitle: controller.user.value.username,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              Divider(),
              SizedBox(height: USizes.spaceBtwItems * 1.5),

              USectionHeading(
                title: 'Profile Settings',
                showViewAll: false,
                padding: 0,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              EditProfileDetailsRow(
                title: 'User ID',
                subTitle: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              EditProfileDetailsRow(
                title: 'Email',
                subTitle: controller.user.value.email,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              EditProfileDetailsRow(
                title: 'Phone Number',
                subTitle: controller.user.value.phoneNumber,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              EditProfileDetailsRow(title: 'Gender', subTitle: 'Male'),
              SizedBox(height: USizes.spaceBtwItems),
              Divider(),
              TextButton(
                onPressed: controller.deletaAccountWarning,
                child: Text(
                  'Close Account',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
