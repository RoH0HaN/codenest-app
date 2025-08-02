import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreateNewBatchController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  Rxn<File> selectedBatchThumbnail = Rxn<File>();

  Rx<DateTime> startDate = Rx<DateTime>(DateTime.now());
  Rx<DateTime> endDate = Rx<DateTime>(DateTime.now());
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  @override
  void onClose() {
    selectedBatchThumbnail.value = null;
    super.onClose();
  }

  Future<void> pickDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      if (isStart) {
        startDate.value = picked;
      } else {
        endDate.value = picked;
      }
    }
  }

  Future<void> pickAvatarImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      selectedBatchThumbnail.value = File(pickedFile.path);
    }
  }

  void create() {}
}
