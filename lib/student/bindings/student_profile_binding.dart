import 'package:codenest/student/controllers/student_profile_controller.dart';
import 'package:get/get.dart';

class StudentProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentProfileController>(() => StudentProfileController());
  }
}
