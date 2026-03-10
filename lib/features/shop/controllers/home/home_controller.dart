import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  RxInt index = 0.obs;

  final controller = CarouselSliderController();

  void changeValue(int value) {
    index.value = value;
  }
}
