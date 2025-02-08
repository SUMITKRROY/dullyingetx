import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../component/myTextForm.dart';
import '../../../../utils/utils.dart';
import '../controllers/profile_register_screen_controller.dart';

class ProfileRegisterScreenView
    extends GetView<ProfileRegisterScreenController> {
    ProfileRegisterScreenView({super.key});
  final ProfileRegisterScreenController controller = Get.put(ProfileRegisterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
             Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                Text('Profile', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 5.h),
                Text("Let's set up your profile", style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                SizedBox(height: 20.h),
                _buildProfileImage(),
                SizedBox(height: 30.h),
                _buildNameField(),
                SizedBox(height: 15.h),
                _buildGenderDropdown(),
                SizedBox(height: 15.h),
                _buildAgeField(),
                SizedBox(height: 15.h),
                _buildBioField(),
                SizedBox(height: 20.h),
                _buildRegisterButton(),
              ],
            ),
          ),
        ),

    );
  }

  Widget _buildProfileImage() {
    return GestureDetector(
      onTap: () => _showPicker(Get.context!),
      child: Obx(() {
        return CircleAvatar(
          radius: 80.r,
          backgroundColor: Colors.grey[300],
          backgroundImage: controller.imageFile.value != null ? FileImage(controller.imageFile.value!) : null,
          child: controller.imageFile.value == null ? Icon(Icons.camera_alt, size: 40.sp, color: Colors.black54) : null,
        );
      }),
    );
  }

  Widget _buildGenderDropdown() {
    return Obx(
          () => DropdownButtonFormField<String>(
        value: controller.selectedGender.value.isEmpty ? null : controller.selectedGender.value,
        decoration: InputDecoration(labelText: 'Gender', filled: true, fillColor: Colors.grey[200]),
        items: ['Male', 'Female', 'Other'].map((gender) => DropdownMenuItem(value: gender, child: Text(gender))).toList(),
        onChanged: (value) => controller.selectGender(value!),
      ),
    );
  }

  Widget _buildNameField() {
    return MyTextForm(
      label: "Name",
      controller: controller.nameController,
      inputFormatters: [LengthLimitingTextInputFormatter(30)],
      validator: true,
      validatorFunc: Utils.validateUserName(),onChanged: (String ) {  },
    );
  }

  Widget _buildAgeField() {
    return MyTextForm(
      label: "Age",
      controller: controller.ageController,
      inputFormatters: [LengthLimitingTextInputFormatter(30)],
      keyboardType: TextInputType.number,
      validator: true,onChanged: (String ) {  },
    );
  }

  Widget _buildBioField() {
    return MyTextForm(
      label: "Bio",
      controller: controller.bioController,
      inputFormatters: [LengthLimitingTextInputFormatter(30)],
      keyboardType: TextInputType.text,
      validator: true,
      maxline: 3, onChanged: (String ) {  },
    );
  }

  Widget _buildRegisterButton() {
    return

      controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : ElevatedButton(
      onPressed: controller.registerUser,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, minimumSize: Size(double.infinity, 50.h)),
      child: Obx(() => controller.isLoading.value
          ? CircularProgressIndicator()
          : Text('REGISTER', style: TextStyle(fontSize: 16.sp))),
    );
  }

  void _showPicker(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Wrap(
          children: [
            Text('Upload Image', textAlign: TextAlign.start),
            SizedBox(height: 50),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.pickImage(ImageSource.camera);
                    Get.back();
                  },
                  child: Column(
                    children: [Icon(Icons.camera_alt_outlined), Text('Camera')],
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    controller.pickImage(ImageSource.gallery);
                    Get.back();
                  },
                  child: Column(
                    children: [Icon(Icons.image_outlined), Text('Gallery')],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
