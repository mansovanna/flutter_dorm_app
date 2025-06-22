import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void currentPage(index) {
    selectedIndex(index);
  }
}
