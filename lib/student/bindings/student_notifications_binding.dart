import 'package:codenest/student/controllers/student_notifications_controller.dart';
import 'package:get/get.dart';

class StudentNotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentNotificationsController>(
        () => StudentNotificationsController());
  }
}
