import 'package:codenest/student/controllers/student_batch_info_controller.dart';
import 'package:get/get.dart';

class StudentBatchInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentBatchInfoController>(() => StudentBatchInfoController());
  }
}
