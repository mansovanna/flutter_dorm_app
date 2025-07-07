import 'package:final_dromitory/app/data/providers/api_provider.dart';
import 'package:final_dromitory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final _provider = Get.find<ApiProvider>();

  final formKey = GlobalKey<FormState>();
  final RxBool isShowPass = true.obs;

  var studentIdController = TextEditingController(text: "11002244");
  var passwordController = TextEditingController(text: "11002244");

  var isStudentIdValide = true.obs;
  var isPasswordValide = true.obs;

  final isLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void showPass() => isShowPass.value = !isShowPass.value;

  void login({required String studentId, required String password}) async {
    isLoading.value = true;
    try {
      final response = await _provider.login(
        studentId: studentId,
        password: password,
      );

      if (response.statusCode == 200) {
        // Login successful
        // Get.toNamed(Routes.HOME);
        // print(response.data.toString());

        // store token in local storage or secure storage
        // For example, using GetStorage or SharedPreferences
        final token = response.data['token'];
        final studentId = response.data['student_id'];
        final username = response.data['username'];
        final image = response.data['image'];
        if (token != null) {
          // Navigate to home page
          // Get.offAllNamed(Routes.HOME);
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
          await prefs.setString('student_id', studentId.toString());
          await prefs.setString('username', username.toString());
          await prefs.setString('image', image.toString());
          Get.offAllNamed(Routes.SPLASH);
          Get.snackbar(
            "Login Successful",
            "You have successfully logged in.",
            icon: Icon(Icons.check_circle, color: Colors.white),
            snackStyle: SnackStyle.FLOATING,
            margin: EdgeInsets.all(10),
            borderRadius: 10,
            borderColor: Colors.green,
            borderWidth: 2,
            colorText: Colors.white,
            backgroundColor: Colors.green,
            titleText: Text(
              "Login Successful $studentId!",
              style: TextStyle(color: Colors.white),
            ),
            messageText: Text(
              "You have successfully logged in.",
              style: TextStyle(color: Colors.white),
            ),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 5),
          );
        } else {
          Get.defaultDialog(
            title: "Login Failed",
            content: Text("Token not found in response."),
          );
        }
      } else {
        Get.defaultDialog(
          title: "Login Failed",
          content: Text("Invalid student ID or password."),
        );
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", content: Text(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }
}
