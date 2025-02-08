import 'package:dullyingetx/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var passwordVisible = true.obs;
  var confirmPasswordVisible = true.obs;

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    confirmPasswordVisible.value = !confirmPasswordVisible.value;
  }

  void updatePassword() {
    if (formKey.currentState!.validate()) {
      // TODO: Implement actual password update logic
      Get.snackbar(
        "Success",
        "Password Updated Successfully!",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offNamed(Routes.LOGIN_SCREEN); // Navigate to login screen
    }
  }
}
