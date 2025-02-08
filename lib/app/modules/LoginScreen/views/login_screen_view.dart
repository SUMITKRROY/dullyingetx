import 'package:dullyingetx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../component/myTextForm.dart';
import '../../../../utils/image.dart';
import '../../../../utils/utils.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
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
                  'Log In',
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Enter your registered email & password',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
                SizedBox(height: 30.h),
                _buildEmailField(),
                SizedBox(height: 15.h),
                _buildPasswordField(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Get.toNamed(Routes.FORGOT_PASSWORD_SCREEN),
                    child: Text('Forgot Password?'),
                  ),
                ),
                SizedBox(height: 20.h),
                _buildLoginButton(),
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
                    Text('New user? '),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.REGISTER_SCREEN),
                      child: Text(
                        'Register',
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
      inputFormatters: [LengthLimitingTextInputFormatter(30)],
      keyboardType: TextInputType.emailAddress,
      validator: true,
      validatorFunc: Utils.emailValidator(),
      prefix: const Icon(Icons.email_outlined),
      onChanged: (String) {},
    );
  }

  Widget _buildPasswordField() {
    return Obx(() => MyTextForm(
      prefix: const Icon(Icons.lock_open_outlined),
      inputFormatters: [LengthLimitingTextInputFormatter(16)],
      label: 'Password',
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
      onChanged: (String) {},
    ));
  }

  Widget _buildLoginButton() {
    return Obx(() => controller.isLoading.value
        ? CircularProgressIndicator()
        : ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          controller.login();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        minimumSize: Size(double.infinity, 50.h),
      ),
      child: Text('LOGIN', style: TextStyle(fontSize: 16.sp)),
    ));
  }

  Widget _buildSocialButton(String text, String iconPath) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(minimumSize: Size(double.infinity, 40.h)),
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
