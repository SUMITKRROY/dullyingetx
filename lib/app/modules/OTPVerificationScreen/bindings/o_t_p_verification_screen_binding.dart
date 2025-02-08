import 'package:get/get.dart';

import '../controllers/o_t_p_verification_screen_controller.dart';

class OTPVerificationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPVerificationScreenController>(
      () => OTPVerificationScreenController(),
    );
  }
}
