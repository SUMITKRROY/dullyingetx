import 'dart:convert';

import 'package:dullyingetx/app/modules/RegisterScreen/controllers/register_repo.dart';
import 'package:dullyingetx/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../config/share_pref.dart';
import '../../../../utils/utils.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  var isLoading = false.obs;
  var passwordVisible = true.obs;
  var confirmPasswordVisible = true.obs;
  var agreeTerms = false.obs;

  final RegisterRepo registerRepo = RegisterRepo();

  Future<void> signUp() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Utils.snackbarToast("All fields are required");
      return;
    }

    isLoading.value = true;
    try {
      var data = json.encode({
        "email": emailController.text,
        "password": passwordController.text,
        "confirmPassword": confirmPasswordController.text
      });

      final response = await registerRepo.getSignup(data);

      if (response.statusCode == 201) {
        String accessToken = response.data['data']['accessToken'];
        await storeAccessToken(accessToken);
        Get.offNamed(Routes.PROFILE_REGISTER_SCREEN); // Navigate to profile page
      } else {
        Utils.snackbarToast(response.data["message"] ?? 'Unknown error');
      }
    } catch (e) {
      Utils.snackbarToast(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
