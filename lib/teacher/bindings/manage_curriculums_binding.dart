import 'package:codenest/teacher/controllers/manage_curriculums_controller.dart';
import 'package:get/get.dart';

class ManageCurriculumsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageCurriculumsController>(
        () => ManageCurriculumsController());
  }
}
