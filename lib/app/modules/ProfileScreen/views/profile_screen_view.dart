import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileController> {
    ProfileScreenView({super.key});
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Profile")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        var user = controller.userProfile;

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: user['image'] != null
                      ? NetworkImage(user['image'])
                      : const AssetImage('assets/default_avatar.png') as ImageProvider,
                ),
              ),
              const SizedBox(height: 20),
              _buildProfileInfo("Full Name", user['fullName'] ?? 'N/A'),
              _buildProfileInfo("Email", user['email'] ?? 'N/A'),
              _buildProfileInfo("Mobile", user['mobileNumber'] ?? 'N/A'),
              _buildProfileInfo("Gender", user['gender'] ?? 'N/A'),
              _buildProfileInfo("Age", user['age'] ?? 'N/A'),
              _buildProfileInfo("Bio", user['bio'] ?? 'N/A'),
              _buildProfileInfo("User Type", user['userType'] ?? 'N/A'),
              _buildProfileInfo("Referral Code", user['refferalCode'] ?? 'N/A'),
              _buildProfileInfo("Member Since", controller.memberSince.value),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.red,
                  ),
                  onPressed: controller.logout,
                  child: const Text("LOGOUT", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}
