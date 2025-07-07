// import 'package:final_dromitory/app/data/providers/api_provider.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController {
  // final _provider = ApiProvider();
  //TODO: Implement ScreenController
  final RxInt selectedIndex = 0.obs;
  final count = 0.obs;
  // final RxBool isLoading = false.obs;
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
