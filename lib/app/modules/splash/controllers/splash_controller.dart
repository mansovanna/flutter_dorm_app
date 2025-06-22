import 'dart:async';

import 'package:final_dromitory/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController


  @override
  void onInit() {
    duration();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void duration ()async {
    Future.delayed(const Duration(seconds: 5), () {

     Get.toNamed(Routes.LOGIN);
     update();
    });
  }
}
