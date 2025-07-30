import 'package:codenest/student/controllers/student_curriculums_controller.dart';
import 'package:get/get.dart';

class StudentCurriculumsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentCurriculumsController>(
        () => StudentCurriculumsController());
  }
}
