import 'package:final_dromitory/app/constants/constants.dart';
// import 'package:final_dromitory/app/controllers/auth_controller.dart';
import 'package:final_dromitory/app/globle_binding/api_binding.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final authController = Get.put(AuthController());
  // await authController.loadLoginStatus();

  runApp(
    GetMaterialApp(
      title: 'Final Dromitory',
      initialRoute: AppPages.INITIAL,
      // authController.isLoggedIn.value ? Routes.HOME : Routes.LOGIN,
      getPages: AppPages.routes,
      initialBinding: ApiBinding(),
      theme: ThemeData(
        fontFamily: AppFonts.battdombang,
        scaffoldBackgroundColor: AppColor.slate,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
