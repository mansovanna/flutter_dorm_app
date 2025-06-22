import 'package:final_dromitory/app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: AppFonts.battdombang,
        scaffoldBackgroundColor: AppColor.slate,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
      ),
    ),
  );
}
