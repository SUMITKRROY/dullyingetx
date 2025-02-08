import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashController> {
  const SplashscreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Obx(
              () => AnimatedSwitcher(
            duration: Duration(milliseconds: 800),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Image.asset(
              controller.images[controller.currentIndex.value],
              key: ValueKey<String>(controller.images[controller.currentIndex.value]),
              height: 250.h,
              width: 250.h,
            ),
          ),
        ),
      ),
    );
  }
}
