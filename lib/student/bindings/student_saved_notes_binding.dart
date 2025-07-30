import 'package:codenest/student/controllers/student_saved_notes_controller.dart';
import 'package:get/get.dart';

class StudentSavedNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentSavedNotesController>(
        () => StudentSavedNotesController());
  }
}
