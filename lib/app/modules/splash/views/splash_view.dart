import 'package:final_dromitory/app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.duration();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //   ----------
                  Image.asset("assets/images/profile.png", width: 140),

                  const SizedBox(height: 35),

                  Text(
                    "ប្រព័ន្ធសុំច្បាប់អន្ដេវាសិកដ្ឋាន",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.moul,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      color: AppColor.sussessDark,
                      backgroundColor: Colors.grey.shade300,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "សូមរងចាំ...",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
