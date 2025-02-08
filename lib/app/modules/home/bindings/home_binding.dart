import 'package:get/get.dart';

import 'package:dullyingetx/app/modules/home/controllers/dialogcontroller_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DialogcontrollerController>(
      () => DialogcontrollerController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
