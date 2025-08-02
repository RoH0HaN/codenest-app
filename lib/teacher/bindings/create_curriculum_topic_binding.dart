import 'package:codenest/teacher/controllers/create_curriculum_topic_controller.dart';
import 'package:get/get.dart';

class CreateCurriculumTopicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateCurriculumTopicController>(
        () => CreateCurriculumTopicController());
  }
}
