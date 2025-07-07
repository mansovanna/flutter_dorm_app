class LeaveHistoryModel {
  final int studentId;
  final String userName;
  final int sumDay;
  final String firstDate;
  final String endDate;
  final String reason;
  final int userId;
  final String status;
  final String reDate;
  final String? adminUsername;

  LeaveHistoryModel({
    required this.studentId,
    required this.userName,
    required this.sumDay,
    required this.firstDate,
    required this.endDate,
    required this.reason,
    required this.userId,
    required this.status,
    required this.reDate,
    this.adminUsername,
  });

  factory LeaveHistoryModel.fromJson(Map<String, dynamic> json) {
    return LeaveHistoryModel(
      studentId: int.tryParse(json['student_id'].toString()) ?? 0,
      userName: json['user_name'] ?? '',
      sumDay: int.tryParse(json['sumday'].toString()) ?? 0,
      firstDate: json['first_date'] ?? '',
      endDate: json['end_date'] ?? '',
      reason: json['reason'] ?? '',
      userId: int.tryParse(json['user_id'].toString()) ?? 0,
      status: json['status'] ?? '',
      reDate: json['re_date'] ?? '',
      adminUsername: json['admin_username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student_id': studentId,
      'user_name': userName,
      'sumday': sumDay,
      'first_date': firstDate,
      'end_date': endDate,
      'reason': reason,
      'user_id': userId,
      'status': status,
      're_date': reDate,
      'admin_username': adminUsername,
    };
  }
}
