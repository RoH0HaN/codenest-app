import 'package:codenest/teacher/controllers/teacher_notifications_controller.dart';
import 'package:get/get.dart';

class TeacherNotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherNotificationsController>(
        () => TeacherNotificationsController());
  }
}
