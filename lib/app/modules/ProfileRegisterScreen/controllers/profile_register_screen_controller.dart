import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/share_pref.dart';
import '../../../../infrastructure/navigation/routes.dart';
import '../../../../utils/utils.dart';
import '../../../routes/app_pages.dart';
import '../../RegisterScreen/controllers/register_repo.dart';

class ProfileRegisterScreenController extends GetxController {
  var isLoading = false.obs;
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var bioController = TextEditingController();
  var selectedGender = ''.obs;
  var imageFile = Rx<File?>(null);
  final ImagePicker imagePicker = ImagePicker();
  String? token;

  @override
  void onInit() {
    super.onInit();
    getToken();
  }

  Future<void> getToken() async {
    token = await getAccessToken();
    print("Token: $token");
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  Future<void> registerUser() async {
    if (nameController.text.isEmpty || ageController.text.isEmpty || bioController.text.isEmpty) {
      Utils.snackbarToast("Please fill in all fields");
      return;
    }

    isLoading(true);

    final RegisterRepo registerRepo = RegisterRepo();

    var data = json.encode({
      "fullName": nameController.text,
      "gender": selectedGender.value,
      "age": ageController.text,
      "bio": bioController.text,
    });

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var dio = Dio();
    var response = await dio.request(
      'https://ayooba-duality-project.vercel.app/api/v1/user/registration',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      Utils.snackbarToast("Registration Successful");
          Get.offNamed(Routes.LOGIN_SCREEN);
    }
    else {
      print(response.statusMessage);
    }

    // try {
    //   final response = await registerRepo.getRegister(data);
    //
    //   if (response.statusCode == 200) {
    //     Utils.snackbarToast("Registration Successful");
    //     Get.offNamed(Routes.LOGIN_SCREEN); // Navigate to home page
    //   } else {
    //     Utils.snackbarToast(response.statusMessage ?? 'Unknown error');
    //   }
    // } catch (e) {
    //   Utils.snackbarToast(e.toString());
    // } finally {
    //   isLoading(false);
    // }
  }
}
