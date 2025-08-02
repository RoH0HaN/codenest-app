import 'package:get/get.dart';

class Student {
  final String name;
  final String email;
  final String phone;
  RxBool isSelected;

  Student({
    required this.name,
    required this.email,
    required this.phone,
    bool isSelected = false,
  }) : isSelected = isSelected.obs;
}
