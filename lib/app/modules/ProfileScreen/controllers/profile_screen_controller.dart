import 'package:dio/dio.dart';
import 'package:dullyingetx/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../config/share_pref.dart';

class ProfileController extends GetxController {

  var isLoading = true.obs;
  var userProfile = {}.obs; // Store user data
  var memberSince = ''.obs; // Store membership date
  String? token;

  // Authorization header (should ideally be stored securely)


  @override
  Future<void> onInit() async {
  super.onInit();
 await getToken();
  fetchUserProfile();

  }



  Future<void> getToken() async {
    token = await getAccessToken();
    print("Token: $token");
  }

  Future<void> fetchUserProfile() async {
    final headers = {
      'Authorization':
      'Bearer $token'
    };
  try {
  var dio = Dio();
  var response = await dio.request(
  'https://ayooba-duality-project.vercel.app/api/v1/user/profile',
  options: Options(method: 'GET', headers: headers),
  );

  if (response.statusCode == 200) {
  var data = response.data;
  userProfile.value = data['data']['user']; // Extracting user object
  memberSince.value = data['data']['memberSince']; // Extracting memberSince date
  } else {
  Get.snackbar("Error", "Failed to load profile");
  }
  } catch (e) {
  Get.snackbar("Error", "Something went wrong: $e");
  } finally {
  isLoading.value = false;
  }
  }

  Future<void> logout() async {
    await clearAllData();
    print("All data cleared. User logged out.");

  Get.offAllNamed(Routes.LOGIN_SCREEN); // Navigate to login screen
  }


}
