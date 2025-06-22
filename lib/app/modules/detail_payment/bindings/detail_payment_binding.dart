import 'package:get/get.dart';

import '../controllers/detail_payment_controller.dart';

class DetailPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPaymentController>(
      () => DetailPaymentController(),
    );
  }
}
