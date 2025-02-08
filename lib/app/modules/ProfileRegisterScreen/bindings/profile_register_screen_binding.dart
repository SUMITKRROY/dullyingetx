import 'package:get/get.dart';

import '../controllers/profile_register_screen_controller.dart';

class ProfileRegisterScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileRegisterScreenController>(
      () => ProfileRegisterScreenController(),
    );
  }
}
