import 'package:codenest/student/controllers/student_new_batches_controller.dart';
import 'package:get/get.dart';

class StudentNewBatchesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentNewBatchesController>(
        () => StudentNewBatchesController());
  }
}
