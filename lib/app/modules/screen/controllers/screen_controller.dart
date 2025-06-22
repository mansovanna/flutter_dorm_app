import 'package:get/get.dart';

class ScreenController extends GetxController {
  //TODO: Implement ScreenController
  final RxInt selectedIndex = 0.obs;
  final count = 0.obs;
  @override
  void onInit() {
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

  void currentPage(int index) {
    selectedIndex.value = index;
    // Add logic to switch pages, e.g. using PageView or IndexedStack
  }
}
