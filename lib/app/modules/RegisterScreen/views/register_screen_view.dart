import 'package:dullyingetx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../component/myTextForm.dart';
import '../../../../utils/image.dart';
import '../controllers/register_screen_controller.dart';

class RegisterScreenView extends GetView<RegisterController> {

  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: GlobalKey<FormState>(),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Image.asset(ImagePath.logo, height: 80.h),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Create Your Account',
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Enter your details to get an account',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
                SizedBox(height: 30.h),
                _buildEmailField(),
                SizedBox(height: 15.h),
                _buildPasswordField(),
                SizedBox(height: 15.h),
                _buildConfirmPasswordField(),
                SizedBox(height: 10.h),
                _buildTermsCheckbox(),
                SizedBox(height: 20.h),
                _buildRegisterButton(),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text('or'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 20.h),
                _buildSocialButton('Login with Google', ImagePath.google),
                SizedBox(height: 10.h),
                _buildSocialButton('Login with Facebook', ImagePath.facebook),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? '),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.LOGIN_SCREEN),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return MyTextForm(
      label: "Email",
      controller: controller.emailController,
      keyboardType: TextInputType.emailAddress,
      validator: true,
      validatorFunc: (value) => value!.isEmpty ? "Enter a valid email" : null,
      onChanged: (String value) {},
    );
  }

  Widget _buildPasswordField() {
    return Obx(() => MyTextForm(
      label: 'Password',
      controller: controller.passwordController,
      keyboardType: TextInputType.text,
      validatorLabel: 'password',
      suffix: IconButton(
        color: Colors.grey,
        icon: Icon(controller.passwordVisible.value
            ? Icons.visibility_off
            : Icons.visibility),
        onPressed: () => controller.passwordVisible.toggle(),
      ),
      obscured: controller.passwordVisible.value,
      validator: true,
      maxline: 1,
      onChanged: (String value) {},
    ));
  }

  Widget _buildConfirmPasswordField() {
    return Obx(() => MyTextForm(
      label: 'Confirm Password',
      controller: controller.confirmPasswordController,
      keyboardType: TextInputType.text,
      validatorLabel: 'confirm password',
      suffix: IconButton(
        color: Colors.grey,
        icon: Icon(controller.confirmPasswordVisible.value
            ? Icons.visibility_off
            : Icons.visibility),
        onPressed: () => controller.confirmPasswordVisible.toggle(),
      ),
      obscured: controller.confirmPasswordVisible.value,
      validator: true,
      maxline: 1,
      onChanged: (String value) {},
    ));
  }

  Widget _buildTermsCheckbox() {
    return Obx(() => Row(
      children: [
        Checkbox(
          value: controller.agreeTerms.value,
          onChanged: (value) => controller.agreeTerms.value = value!,
        ),
        Text('Agree with Our '),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Terms & Conditions',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ));
  }

  Widget _buildRegisterButton() {
    return Obx(() => ElevatedButton(
      onPressed: controller.isLoading.value || !controller.agreeTerms.value
          ? null
          : () => controller.signUp(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        minimumSize: Size(double.infinity, 50.h),
      ),
      child: controller.isLoading.value
          ? CircularProgressIndicator()
          : Text('REGISTER', style: TextStyle(fontSize: 16.sp)),
    ));
  }

  Widget _buildSocialButton(String text, String iconPath) {
    return OutlinedButton(
        onPressed: () {},
    style: OutlinedButton.styleFrom(
    minimumSize: Size(double.infinity, 40.h),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset(iconPath, height: 20.h),
    SizedBox(width: 10.w),
    Text(text, style: TextStyle(fontSize: 14.sp, color: Colors.black)),
    ],
    ),
    );
  }
}
