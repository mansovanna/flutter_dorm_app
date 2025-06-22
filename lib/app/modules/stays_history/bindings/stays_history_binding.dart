import 'package:get/get.dart';

import '../controllers/stays_history_controller.dart';

class StaysHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaysHistoryController>(
      () => StaysHistoryController(),
    );
  }
}
