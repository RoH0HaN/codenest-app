import 'package:codenest/teacher/controllers/pending_join_requests_controller.dart';
import 'package:get/get.dart';

class PendingJoinRequestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PendingJoinRequestsController>(
        () => PendingJoinRequestsController());
  }
}
