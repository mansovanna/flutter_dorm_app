import 'package:get/get.dart';

import '../controllers/request_pay_controller.dart';

class RequestPayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestPayController>(
      () => RequestPayController(),
    );
  }
}
