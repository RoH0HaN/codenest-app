import 'package:codenest/teacher/controllers/create_new_batch_controller.dart';
import 'package:get/get.dart';

class CreateNewBatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateNewBatchController>(() => CreateNewBatchController());
  }
}
