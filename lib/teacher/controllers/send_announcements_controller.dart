import 'package:codenest/routes/route_names.dart';
import 'package:codenest/teacher/models/students_for_selection_model.dart';
import 'package:get/get.dart';

class SendAnnouncementsController extends GetxController {
  RxList<Student> students = <Student>[
    Student(
      name: "Rohan Debnath",
      email: "rohan251@outlook.com",
      phone: "+91 1234567890",
    ),
    Student(
      name: "Zunaid Ahammed",
      email: "zunaid.a10@outlook.com",
      phone: "+91 1234567890",
    ),
    Student(
      name: "Chiranjit Das",
      email: "chiranjit.das@outlook.com",
      phone: "+91 1234567890",
    ),
    Student(
      name: "Sumanta Biswas",
      email: "sumanta.biswas@outlook.com",
      phone: "+91 1234567890",
    ),
  ].obs;

  void next() {
    Get.toNamed(RouteNames.selectStudentsForAnnouncements);
  }
}
