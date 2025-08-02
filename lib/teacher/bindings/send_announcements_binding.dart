import 'package:codenest/teacher/controllers/send_announcements_controller.dart';
import 'package:get/get.dart';

class SendAnnouncementsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendAnnouncementsController>(
        () => SendAnnouncementsController());
  }
}
