import 'package:codenest/student/controllers/student_notes_controller.dart';
import 'package:get/get.dart';

class StudentNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentNotesController>(() => StudentNotesController());
  }
}
