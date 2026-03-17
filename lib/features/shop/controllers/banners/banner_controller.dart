import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce_app/data/repositories/banner/banner_repository.dart';
import 'package:ecommerce_app/features/shop/models/banners_model.dart';
import 'package:ecommerce_app/utils/popups/snackbar_helpers.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class BannerController extends GetxController {
  final _repository = Get.put(BannerRepository());
  static BannerController get instance => Get.find();
  RxList<BannerModel> banners = <BannerModel>[].obs;
  
  RxBool isBannerLoading = false.obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  RxInt index = 0.obs;

  final controller = CarouselSliderController();

  void changeValue(int value) {
    index.value = value;
  }

  Future<void> fetchBanners() async {
    try {
      isBannerLoading.value = true;
      List<BannerModel> fetchedBanners = await _repository.getBanners();
      banners.value = fetchedBanners;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Error fetching',
        message: e.toString(),
      );
    } finally {
      isBannerLoading.value = false;
    }
  }
}
