import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController textController1 = TextEditingController();

  register() {
    Get.toNamed('/onboarding');
  }
}
