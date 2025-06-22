import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LeaveHistoryController extends GetxController {
  //TODO: Implement LeaveHistoryController
  final TextEditingController username = TextEditingController();
  final TextEditingController student_id = TextEditingController();
  final TextEditingController start_day = TextEditingController();
  final TextEditingController first_day = TextEditingController();
  final TextEditingController total_day = TextEditingController();
  final TextEditingController description = TextEditingController();

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

  void increment() => count.value++;
}
