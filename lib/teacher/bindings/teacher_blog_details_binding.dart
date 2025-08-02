import 'package:codenest/teacher/controllers/teacher_blog_details_controller.dart';
import 'package:get/get.dart';

class TeacherBlogDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherBlogDetailsController>(
        () => TeacherBlogDetailsController());
  }
}
