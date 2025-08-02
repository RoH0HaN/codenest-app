class PendingJoinRequest {
  final String id;
  final String batchId;
  final String userId;
  final String name;
  final String email;
  final String phone;
  final String status;

  PendingJoinRequest({
    required this.id,
    required this.batchId,
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
  });
}

class BatchJoinRequestGroup {
  final String batchId;
  final String batchName;
  final String batchDescription;
  final DateTime startDate;
  final DateTime endDate;
  final List<PendingJoinRequest> requests;

  BatchJoinRequestGroup({
    required this.batchId,
    required this.batchName,
    required this.batchDescription,
    required this.startDate,
    required this.endDate,
    required this.requests,
  });
}
