import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../utils/image.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                _buildHeader(),
                _buildUserStories(controller),
                Obx(() => Column(
                  children: controller.posts
                      .map((post) => _buildPostItem(post))
                      .toList(),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(ImagePath.splash4, height: 60.h),
        Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Image.asset(ImagePath.me)),
      ],
    );
  }

  Widget _buildUserStories(HomeController controller) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: SizedBox(
        height: 120.h,
        child: Obx(
              () => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];
              return Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(user['image']!),
                    SizedBox(height: 5.h),
                    Text(user['name']!, style: TextStyle(fontSize: 12.sp)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPostItem(Map<String, String> post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5,bottom: 5),
          //width: double.infinity,
          height: 300.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(post['postImage']!),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
