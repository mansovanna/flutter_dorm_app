import 'dart:convert';

import 'package:final_dromitory/app/constants/constants.dart';
import 'package:final_dromitory/app/data/models/LeaveHistoryModel.dart';
import 'package:final_dromitory/app/data/providers/api_provider.dart';
import 'package:final_dromitory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveHistoryController extends GetxController {
  final _provider = ApiProvider();
  final TextEditingController username = TextEditingController();
  final TextEditingController student_id = TextEditingController();
  final TextEditingController start_day = TextEditingController();
  final TextEditingController first_day = TextEditingController();
  final TextEditingController total_day = TextEditingController();
  final TextEditingController description = TextEditingController();

  final RxBool isLoading = true.obs;
  final RxString isMessage = "".obs;
  final RxList<LeaveHistoryModel> data_server = <LeaveHistoryModel>[].obs;

  final RxString selectedStatus = ' '.obs;
  final RxInt selectIndexStatus = 0.obs;
  //
  final count = 0.obs;
  @override
  void onInit() {
    getHistory();
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

  void getHistory({String status = ""}) async {
    isLoading(true);
    // print(status);

    try {
      final response = await _provider.getHistoryLeave(status: status);

      final data =
          response.data is String ? jsonDecode(response.data) : response.data;

      if (response.statusCode == 200) {
        if (data['success'] == true && data['history'] != null) {
          final List historyList = data['history'];

          data_server.value =
              historyList
                  .map((json) => LeaveHistoryModel.fromJson(json))
                  .toList();
          update();

          // Print one reason as a test
          // for (var item in data_server) {
          //   print("Reason: ${item.userName}");
          // }
        }
      } else {
        // status = 401 token expired
        Get.showSnackbar(
          GetSnackBar(
            title: 'Unauthorized',
            message: 'Token has expired. Please log in again.',
            duration: Duration(seconds: 3),
            backgroundColor: Colors.redAccent,
            snackPosition: SnackPosition.TOP,
            titleText: Text(
              'Unauthorized',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            messageText: Text(
              'Token has expired. Please log in again.',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        );

        // Navigate to login page after showing the snackbar
        Future.delayed(Duration(milliseconds: 100), () {
          Get.offAllNamed(Routes.LOGIN);
        });
      }
    } catch (e) {
      print('Catch Error: $e');
    } finally {
      isLoading(false);
    }
  }

  // post request leave
  void post({
    required String username,
    required String student_id,
    required String start_day,
    required String first_day,
    required String total_day,
    required String description,
  }) async {
    //
    Object data = {
      'username': username,
      'student_id': student_id,
      'first_date': start_day,
      'end_date': first_day,
      'sumday': total_day,
      'reason': description,
    };

    try {
      final response = await _provider.postLeave(data: data);

      if (response.statusCode == 200) {
        Get.back();
        getHistory();
        Get.snackbar(
          "Success",
          "You Requested Leave Success!",
          backgroundColor: AppColor.sussessDark,
          colorText: Colors.white,
        );
        print(response);
      } else {
        Get.snackbar(
          "Error",
          "Faile Request leave!",
          backgroundColor: AppColor.danger,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e);
      Get.snackbar(
        "Error",
        "$e",
        backgroundColor: AppColor.danger,
        colorText: Colors.white,
      );
    }

    // -----------------------------

    // print(data);
  }
}
