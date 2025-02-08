import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DialogviewView extends GetView {
  const DialogviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DialogviewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DialogviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
