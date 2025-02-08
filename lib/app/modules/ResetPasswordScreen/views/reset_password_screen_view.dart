import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../../component/myTextForm.dart';
import '../controllers/reset_password_screen_controller.dart';

class ResetPasswordScreenView extends GetView<ResetPasswordController> {
    ResetPasswordScreenView({super.key});
  final ResetPasswordController controller = Get.put(ResetPasswordController());

  Widget _buildPasswordField() {
    return Obx(
          () => MyTextForm(
        inputFormatters: [LengthLimitingTextInputFormatter(16)],
        label: 'Password',
        onChanged: (val) => {},
        controller: controller.passwordController,
        keyboardType: TextInputType.text,
        validatorLabel: 'password',
        suffix: IconButton(
          color: Colors.grey,
          icon: Icon(controller.passwordVisible.value
              ? Icons.visibility_off
              : Icons.visibility),
          onPressed: controller.togglePasswordVisibility,
        ),
        obscured: controller.passwordVisible.value,
        validator: true,
        maxline: 1,
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return Obx(
          () => MyTextForm(
        inputFormatters: [LengthLimitingTextInputFormatter(16)],
        label: 'Confirm Password',
        onChanged: (val) => {},
        controller: controller.confirmPasswordController,
        keyboardType: TextInputType.text,
        validatorLabel: 'confirm password',
        suffix: IconButton(
          color: Colors.grey,
          icon: Icon(controller.confirmPasswordVisible.value
              ? Icons.visibility_off
              : Icons.visibility),
          onPressed: controller.toggleConfirmPasswordVisibility,
        ),
        obscured: controller.confirmPasswordVisible.value,
        validator: true,
        validatorFunc: (value) {
          if (value != controller.passwordController.text) {
            return "Passwords do not match";
          }
          return null;
        },
        maxline: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text("New Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const Text(
                "Set the new password for your account so you can login and access all features",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              _buildPasswordField(),
              const SizedBox(height: 15),
              _buildConfirmPasswordField(),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.updatePassword,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("UPDATE PASSWORD"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
