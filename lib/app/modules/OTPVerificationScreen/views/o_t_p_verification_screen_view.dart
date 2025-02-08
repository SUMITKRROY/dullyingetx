import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/o_t_p_verification_screen_controller.dart';

class OTPVerificationScreenView
    extends GetView<OTPVerificationScreenController> {
  const OTPVerificationScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTPVerificationScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OTPVerificationScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
