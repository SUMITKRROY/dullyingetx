import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_navbar_screen_controller.dart';

class MyNavbarScreenView extends GetView<NavbarController> {
  const MyNavbarScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final NavbarController controller = Get.put(NavbarController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          backgroundColor: Colors.blueAccent,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore, color: Colors.black),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined, color: Colors.black),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

}
