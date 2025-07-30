import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final whatsappController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var showPassword = false.obs;

  final ImagePicker _picker = ImagePicker();
  Rxn<File> selectedAvatar = Rxn<File>();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void toggleShowPassword() {
    showPassword.value = !showPassword.value;
  }

  Future<void> pickAvatarImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      selectedAvatar.value = File(pickedFile.path);
    }
  }

  void signup() {}
}
