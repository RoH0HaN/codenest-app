import 'package:codenest/teacher/controllers/teacher_blog_controller.dart';
import 'package:get/get.dart';

class TeacherBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherBlogController>(() => TeacherBlogController());
  }
}
