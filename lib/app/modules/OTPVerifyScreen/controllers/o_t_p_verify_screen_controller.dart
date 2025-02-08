import 'package:dullyingetx/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OTPVerifyScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

  void verifyOTP() {
    if (formKey.currentState!.validate()) {
      // TODO: Implement actual OTP verification logic
      Get.snackbar(
        "Success",
        "OTP Verified Successfully!",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offNamed(Routes.RESET_PASSWORD_SCREEN); // Navigate to reset password screen
    }
  }

  void resendOTP() {
    // TODO: Implement resend OTP logic
    Get.snackbar(
      "OTP Resent",
      "A new OTP has been sent to your email.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
