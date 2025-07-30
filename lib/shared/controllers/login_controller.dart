import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_names.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var showPassword = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void toggleShowPassword() {
    showPassword.value = !showPassword.value;
  }

  void login() {
    // Get.toNamed(RouteNames.studentHome);
    Get.toNamed(RouteNames.teacherHome);
  }
}
