import 'package:codenest/teacher/controllers/teacher_profile_controller.dart';
import 'package:get/get.dart';

class TeacherProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherProfileController>(() => TeacherProfileController());
  }
}
