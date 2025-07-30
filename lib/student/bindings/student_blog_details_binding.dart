import 'package:codenest/student/controllers/student_blog_details_controller.dart';
import 'package:get/get.dart';

class StudentBlogDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentBlogDetailsController>(
        () => StudentBlogDetailsController());
  }
}
