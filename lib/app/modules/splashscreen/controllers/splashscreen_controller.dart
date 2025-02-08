import 'dart:async';

import 'package:get/get.dart';

import '../../../../config/share_pref.dart';
import '../../../../utils/image.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  var currentIndex = 0.obs;
  final List<String> images = [
    ImagePath.splash1,
    ImagePath.splash2,
    ImagePath.splash3,
    ImagePath.splash4
  ];

  @override
  void onInit() {
    super.onInit();
    startAnimation();
  }
  // Check if token exists
  Future<void> checkTokenAndProceed() async {
    String? token = await getAccessToken();
    if (token != null && token.isNotEmpty) {
      // If token exists, navigate to Bottom Navbar
      Get.offNamed(Routes.MY_NAVBAR_SCREEN);
    } else {
      // If no token, proceed with animation
      Get.offNamed(Routes.ONBOARDING_SCREEN);
    }
  }

  void startAnimation() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentIndex.value < images.length - 1) {
        currentIndex.value++;
      } else {
        timer.cancel();
        Future.delayed(Duration(seconds: 1), () {
          // Get.offNamed(Routes.ONBOARDING_SCREEN);
          checkTokenAndProceed();
        });
      }
    });
  }
}
