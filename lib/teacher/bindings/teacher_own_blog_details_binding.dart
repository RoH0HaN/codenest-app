import 'package:codenest/teacher/controllers/teacher_own_blog_details_controller.dart';
import 'package:get/get.dart';

class TeacherOwnBlogDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherOwnBlogDetailsControllers>(
        () => TeacherOwnBlogDetailsControllers());
  }
}
