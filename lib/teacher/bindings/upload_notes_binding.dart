import 'package:codenest/teacher/controllers/upload_notes_controller.dart';
import 'package:get/get.dart';

class UploadNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadNotesController>(() => UploadNotesController());
  }
}
