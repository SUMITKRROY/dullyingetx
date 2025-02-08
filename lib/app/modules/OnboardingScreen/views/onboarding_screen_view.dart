import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_screen_controller.dart';

class OnboardingScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OnboardingScreenController controller = Get.put(OnboardingScreenController());

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: (index) => controller.currentPage.value = index,
            itemCount: controller.onboardingData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 500.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(controller.onboardingData[index]["image"]!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    controller.onboardingData[index]["title"]!,
                    style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.onboardingData[index]["description"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              );
            },
          ),

          Positioned(
            top: 40.h,
            right: 20.w,
            child: TextButton(
              onPressed: controller.skipOnboarding,
              child: Text("Skip", style: TextStyle(color: Colors.white)),
            ),
          ),

          Positioned(
            bottom: 120.h,
            left: 0,
            right: 0,
            child: Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.onboardingData.length,
                      (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: controller.currentPage.value == index ? 16 : 8,
                    decoration: BoxDecoration(
                      color: controller.currentPage.value == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 50.h,
            left: 20.w,
            right: 20.w,
            child: Obx(
                  () => Center(
                child: ElevatedButton(
                  onPressed: controller.currentPage.value == controller.onboardingData.length - 1
                      ? controller.skipOnboarding
                      : controller.nextPage,
                  child: Text(
                    controller.currentPage.value == controller.onboardingData.length - 1
                        ? "Get Started"
                        : "Next",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}