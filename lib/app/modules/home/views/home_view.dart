import 'package:final_dromitory/app/constants/constants.dart';
import 'package:final_dromitory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'ប្រព័ន្ធសុំច្បាប់អន្តេវាសិកដ្ឋាន',
          style: TextStyle(color: AppColor.sussessDark),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // -----------
              Get.toNamed(Routes.NOTIFICATION);
            },
            icon: Badge(
              textColor: Colors.white,
              backgroundColor: AppColor.danger,
              label: Text(
                "5",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: AppFonts.poppins,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedNotification01,
                color: Colors.black,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  // -----------
                  Get.toNamed(Routes.LEAVE_HISTORY);
                },
                child: _buildSmallBoxRequestLeave(),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  // ------------
                  Get.toNamed(Routes.PAYMENT_HISTORY);
                },
                child: _buildSmallBoxPayment(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmallBoxRequestLeave() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [AppColor.info, AppColor.info.withOpacity(0.6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "ចំនួនសុំច្បាប់",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "5",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontFamily: AppFonts.poppins,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SvgPicture.string(
              SvgIcon.order,
              width: 90,
              height: 90,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallBoxPayment() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [AppColor.danger, AppColor.danger.withOpacity(0.6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "ចំនួនបង់ប្រាក់",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "5",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontFamily: AppFonts.poppins,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SvgPicture.string(
              SvgIcon.money,
              width: 90,
              height: 90,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
