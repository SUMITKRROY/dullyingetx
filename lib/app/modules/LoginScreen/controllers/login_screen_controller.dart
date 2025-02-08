import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../config/api_route.dart';
import '../../../../config/share_pref.dart';
import '../../../../utils/dio_helper.dart';
import '../../../../utils/utils.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  // Controllers for TextFields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // State variables
  var isLoading = false.obs;
  var passwordVisible = false.obs;

  // Dio and API configurations
  final Dio dio = DioApi().sendRequest;
  final ApiRoute route = ApiRoute();

  // Toggle Password Visibility
  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  // Login Function
  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Utils.snackbarToast("Email and Password can't be empty");
      return;
    }

    isLoading.value = true;

    try {
      var data = json.encode({
        "email": emailController.text.trim(),
        "password": passwordController.text.trim()
      });

      final response = await dio.post(route.login, data: data);

      if (response.statusCode == 200) {
        String accessToken = response.data['data']['token'];
        await storeAccessToken(accessToken);
        Get.offAllNamed(Routes.MY_NAVBAR_SCREEN);
      } else {
        Utils.snackbarToast(response.statusMessage ?? 'Login failed');
      }
    } catch (e) {
      Utils.snackbarToast("Error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
