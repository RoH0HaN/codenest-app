import 'package:codenest/teacher/controllers/teacher_batch_details_controller.dart';
import 'package:get/get.dart';

class TeacherBatchDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherBatchDetailsController>(
        () => TeacherBatchDetailsController());
  }
}
