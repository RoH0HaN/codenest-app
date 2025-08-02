import 'package:codenest/teacher/models/grouped_join_requests_model.dart';
import 'package:get/get.dart';

class PendingJoinRequestsController extends GetxController {
  final List<BatchJoinRequestGroup> testData = [
    BatchJoinRequestGroup(
      batchId: "b1",
      batchName: "Data Structure and Algorithms",
      batchDescription:
          "Master the building blocks of efficient coding. Learn Data Structure...",
      startDate: DateTime(2025, 1, 20),
      endDate: DateTime(2025, 1, 20),
      requests: [
        PendingJoinRequest(
          id: "r1",
          batchId: "b1",
          userId: "u1",
          name: "Chiranjit Das",
          email: "chiranjitdas@gmail.com",
          phone: "+91 9730543192",
          status: "pending",
        ),
        PendingJoinRequest(
          id: "r2",
          batchId: "b1",
          userId: "u2",
          name: "Souvik Biswas",
          email: "souvikbiswas@gmail.com",
          phone: "+91 6548790825",
          status: "pending",
        )
      ],
    ),
    BatchJoinRequestGroup(
      batchId: "b2",
      batchName: "Theory of Computation",
      batchDescription:
          "Master the building blocks of efficient coding. Learn Data Structure...",
      startDate: DateTime(2025, 1, 20),
      endDate: DateTime(2025, 1, 25),
      requests: [
        PendingJoinRequest(
          id: "r3",
          batchId: "b2",
          userId: "u1",
          name: "Chiranjit Das",
          email: "chiranjitdas@gmail.com",
          phone: "+91 9730543192",
          status: "pending",
        )
      ],
    ),
  ];
}
