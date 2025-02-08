import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../presentation/home/home.screen.dart';
import '../../ProfileScreen/views/profile_screen_view.dart';

class NavbarController extends GetxController {
  var currentIndex = 0.obs; // Observable variable

  final List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    ProfileScreenView(),
    HomeScreen(),
    // ExploreScreen(),
    // CameraScreen(),
    // ProfileScreen(),
    // SettingsScreen(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
