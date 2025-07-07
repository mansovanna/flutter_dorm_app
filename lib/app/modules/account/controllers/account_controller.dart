import 'dart:convert';

import 'package:final_dromitory/app/data/providers/api_provider.dart';
import 'package:final_dromitory/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountController extends GetxController {
  //TODO: Implement AccountController

  final _provider = Get.find<ApiProvider>();

  final RxString imageUrl = "".obs;
  final RxString username = "".obs;
  final RxString student_id = "".obs;

  @override
  void onInit() {
    // Initialize any necessary data or state here
    // For example, you might want to fetch the user's profile when the controller is initialized
    // getProfile();
    // You can also set up listeners or other initializations here
    // For example, if you have a stream or a periodic task, you can start it

    // getProfile();
    super.onInit();
  }

  void getUser() async {
    try {
      final response = await _provider.getProfile();

      final data =
          response.data is String ? jsonDecode(response.data) : response.data;

      print("Decoded data: ${data}");

      if (response.statusCode == 200) {
        if (data is List && data.isNotEmpty) {
          final user = data[0];
          // print("User name: ${user['username']}");
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('imgeUrl', user['img']);
          await prefs.setString('username', user['username']);
          await prefs.setString('student_id', user['student_id']);
          // set user login ready...
          await prefs.setBool('logged_in', true);

          // get data paket form storage
          username.value = prefs.getString('username') ?? "";
          student_id.value = prefs.getString('student_id') ?? "";
          imageUrl.value = prefs.getString('imgeUrl') ?? "";
          print('This is:${username.value}');

          Get.offAllNamed(Routes.SCREEN);
        } else {
          print("Invalid or empty user data.");
          // Get.offAllNamed(Routes.LOGIN);
        }
      }
    } catch (e) {
      print("Exception: $e");
      Get.snackbar("Error", e.toString());
      Get.offAllNamed(Routes.LOGIN);
    } finally {
      // isLoading.value = false;
    }
  }

  void logout() async {
    // Clear user data from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Call API logout if needed
    await _provider.logout();

    // Navigate to login screen
    Get.offAllNamed(Routes.LOGIN);
  }
}
