import 'package:codenest/teacher/controllers/my_followers_controller.dart';
import 'package:get/get.dart';

class MyFollowersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyFollowersController>(() => MyFollowersController());
  }
}
