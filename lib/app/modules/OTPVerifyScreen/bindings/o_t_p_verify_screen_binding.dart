import 'package:get/get.dart';

import '../controllers/o_t_p_verify_screen_controller.dart';

class OTPVerifyScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPVerifyScreenController>(
      () => OTPVerifyScreenController(),
    );
  }
}
