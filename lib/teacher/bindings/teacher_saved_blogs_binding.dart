import 'package:codenest/teacher/controllers/teacher_saved_blog_controller.dart';
import 'package:get/get.dart';

class TeacherSavedBlogsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherSavedBlogController>(() => TeacherSavedBlogController());
  }
}
