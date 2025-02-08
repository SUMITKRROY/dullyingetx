import 'package:get/get.dart';

import '../controllers/my_navbar_screen_controller.dart';

class MyNavbarScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(
      () => NavbarController(),
    );
  }
}
