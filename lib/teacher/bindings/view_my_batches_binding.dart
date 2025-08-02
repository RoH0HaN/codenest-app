import 'package:codenest/teacher/controllers/view_my_batches_controller.dart';
import 'package:get/get.dart';

class ViewMyBatchesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewMyBatchesController>(() => ViewMyBatchesController());
  }
}
