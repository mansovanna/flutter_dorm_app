import 'package:get/get.dart';

import '../controllers/leave_history_controller.dart';

class LeaveHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaveHistoryController>(
      () => LeaveHistoryController(),
    );
  }
}
