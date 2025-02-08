import 'package:dullyingetx/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  void submit() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(Routes.O_T_P_VERIFY_SCREEN); // Navigate using GetX
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

}
