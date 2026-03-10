import 'package:ecommerce_app/common/style/padding.dart';
import 'package:ecommerce_app/common/widgets/appbar/custom_appbar.dart';
import 'package:ecommerce_app/common/widgets/icon/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/images/user_profile_logo.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/screens/edit_profile/widgets/edit_profile_details.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Center(child: UCircularIcon(icon: Iconsax.edit)),
                  ),
                ],
              ),
              SizedBox(height: USizes.spaceBtwItems),
              Divider(),

              SizedBox(height: USizes.spaceBtwItems*1.5),
              USectionHeading(
                title: 'Account Settings',
                showViewAll: false,
                padding: 0,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              EditProfileDetailsRow(title: 'Name', subTitle: 'Dhruv Garg'),
              SizedBox(height: USizes.spaceBtwItems),
              EditProfileDetailsRow(
                title: 'Username',
                subTitle: 'dhruvgarg535',
              ),
              SizedBox(height: USizes.spaceBtwItems),
              Divider(),
              SizedBox(height: USizes.spaceBtwItems*1.5),

              USectionHeading(
                title: 'Profile Settings',
                showViewAll: false,
                padding: 0,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              EditProfileDetailsRow(
                title: 'User ID',
                subTitle: '232345',
                icon: Iconsax.copy,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              EditProfileDetailsRow(
                title: 'Email',
                subTitle: 'garg53573@gmail.com',
              ),
              SizedBox(height: USizes.spaceBtwItems),
              EditProfileDetailsRow(
                title: 'Phone Number',
                subTitle: '8218068160',
              ),
              SizedBox(height: USizes.spaceBtwItems),
              EditProfileDetailsRow(title: 'Gender', subTitle: 'Male'),
              SizedBox(height: USizes.spaceBtwItems),
              Divider(),
              TextButton(
                onPressed: () {},
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
