import 'package:codenest/student/controllers/student_saved_blogs_controller.dart';
import 'package:get/get.dart';

class StudentSavedBlogsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentSavedBlogsController>(
        () => StudentSavedBlogsController());
  }
}
