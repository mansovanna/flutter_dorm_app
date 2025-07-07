import 'package:final_dromitory/app/modules/account/controllers/account_controller.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  late final AccountController accountController;
  final isLoading = false.obs;
  final RxString imageUrl = "".obs;
  final RxString username = "".obs;
  final RxString student_id = "".obs;

  @override
  void onInit() {
    super.onInit();
    if (!Get.isRegistered<AccountController>()) {
      Get.put(AccountController());
    }
    accountController = Get.find<AccountController>();
    Future.delayed(Duration(seconds: 2), () => accountController.getUser());
  }
}
