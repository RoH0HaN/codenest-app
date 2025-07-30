import 'package:codenest/student/controllers/student_batch_details_controller.dart';
import 'package:get/get.dart';

class StudentBatchDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentBatchDetailsController>(
        () => StudentBatchDetailsController());
  }
}
