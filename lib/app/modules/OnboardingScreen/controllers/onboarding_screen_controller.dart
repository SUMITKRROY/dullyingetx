import 'package:dullyingetx/app/routes/app_pages.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingScreenController extends GetxController {
  var currentPage = 0.obs;
  final PageController pageController = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Welcome to Dually",
      "description": "Twice the view, double the impact",
      "image": "assets/images/onboard/onboard_1.png"
    },
    {
      "title": "Dual Camera Recording",
      "description": "Capture synchronized video/photos",
      "image": "assets/images/onboard/onboard_2.png"
    },
    {
      "title": "Social Interaction",
      "description": "Like & comment on photos in real time",
      "image": "assets/images/onboard/onboard_3.png"
    },
  ];

  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void skipOnboarding() {
    Get.offNamed(Routes.LOGIN_SCREEN);
  }
}
