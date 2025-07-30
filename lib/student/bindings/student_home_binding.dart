import 'package:codenest/student/controllers/student_home_controller.dart';
import 'package:get/get.dart';

class StudentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentHomeController>(() => StudentHomeController());
  }
}
