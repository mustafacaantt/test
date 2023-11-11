import 'package:get/get.dart';
import 'package:hesapmakinesi1/controller/home_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Home Controller
    Get.put<HomeController>(HomeController());
  }
}
