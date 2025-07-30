import 'package:codenest/student/controllers/student_blogs_controller.dart';
import 'package:get/get.dart';

class StudentBlogsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentBlogsController>(() => StudentBlogsController());
  }
}
