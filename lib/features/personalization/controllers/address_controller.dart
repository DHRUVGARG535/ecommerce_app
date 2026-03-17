import 'package:ecommerce_app/common/widgets/loaders/circular_loader.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/data/repositories/address/address_repository.dart';
import 'package:ecommerce_app/features/personalization/models/address_model.dart';
import 'package:ecommerce_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();

  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  RxBool refreshData = false.obs;

  final _repository = Get.put(AddressRepository());
  final addressFormKey = GlobalKey<FormState>();

  Future<void> addNewAddress() async {
    try {
      UFullScreenLoader.openLoadingDialog('Processing....');

      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        USnackBarHelpers.warningSnackBar(title: 'Please connect to Internet');
        UFullScreenLoader.stopLoading();
        return;
      }
      if (!addressFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      AddressModel address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        dateTime: DateTime.now(),
        selectedAddress: true,
      );

      final id = await _repository.uploadAddress(address);
      address.id = id;

      updateAddress(address: address);
      refreshData.toggle();

      UFullScreenLoader.stopLoading();

      USnackBarHelpers.successSnackBar(
        title: 'Congratualtions',
        message: 'Your address has been saved successfully',
      );

      resetFormField();

      Navigator.pop(Get.context!);
      Navigator.pop(Get.context!);
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> selectedNewAddress(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(USizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              USectionHeading(title: 'Select Address', showViewAll: false),
              SizedBox(height: USizes.spaceBtwItems),
              FutureBuilder(
                future: fetchAddress(),
                builder: (context, snapshot) {
                  final widget = UCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                  );
                  if (widget != null) return widget;

                  return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => SingleAddressTile(
                      address: snapshot.data![index],
                      onTap: () {
                        updateAddress(address: snapshot.data![index]);
                        Get.back();
                      },
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: USizes.spaceBtwItems),
                    itemCount: snapshot.data!.length,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<AddressModel>> fetchAddress() async {
    try {
      List<AddressModel> addresses = await _repository.fetchAddress();
      selectedAddress.value = addresses.firstWhere(
        (address) => address.selectedAddress,
        orElse: () => AddressModel.empty(),
      );
      return addresses;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }

  Future<void> updateAddress({required AddressModel address}) async {
    try {
      Get.defaultDialog(
        backgroundColor: Colors.transparent,
        title: '',
        onWillPop: () async => false,
        barrierDismissible: false,
        content: UCircularLoader(),
      );

      if (selectedAddress.value.id.isNotEmpty) {
        await _repository.updateSelectedAddress(
          selectedAddress.value.id,
          false,
        );
      }

      address.selectedAddress = true;
      selectedAddress.value = address;

      await _repository.updateSelectedAddress(selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      Get.back();
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  void resetFormField() {
    name.clear();
    phoneNumber.clear();
    state.clear();
    postalCode.clear();
    country.clear();
    street.clear();
    city.clear();
  }
}
