import 'package:get/get.dart';

class StudentBlogsController extends GetxController {
  List<String> blogCategories = [
    'All',
    'Business',
    'Design',
    'Development',
    'Marketing',
  ];

  RxString selectedCategory = 'All'.obs;
}
