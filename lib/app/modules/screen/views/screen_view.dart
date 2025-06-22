import 'package:final_dromitory/app/constants/constants.dart';
import 'package:final_dromitory/app/modules/account/views/account_view.dart';
import 'package:final_dromitory/app/modules/home/views/home_view.dart';
import 'package:final_dromitory/app/modules/rules/views/rules_view.dart';
import 'package:final_dromitory/app/modules/staff/views/staff_view.dart';
import 'package:final_dromitory/app/modules/stays_history/views/stays_history_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/screen_controller.dart';

class ScreenView extends GetView<ScreenController> {
  const ScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // final homeController = Get.put(HomeController());
    final List<Map<String, dynamic>> _navItems = [
      {'icon': SvgIcon.home, 'label': 'ទំព័រដើម'},
      {'icon': SvgIcon.time, 'label': 'ប្រវត្តិស្នាក់នៅ'},
      {'icon': SvgIcon.users, 'label': 'បុគ្គលិក'},
      {'icon': SvgIcon.law, 'label': 'បទបញ្ជារផ្ទៃក្នុង'},
      {
        'iconWidget': CircleAvatar(
          radius: 12,
          backgroundImage: NetworkImage(
            'https://www.shutterstock.com/image-photo/smiling-african-american-millennial-businessman-600nw-1437938108.jpg',
          ),
        ),
        'label': 'ប្រវត្តិរូប',
      },
    ];

    final List pages = [
      HomeView(),
      StaysHistoryView(),
      StaffView(),
      RulesView(),
      AccountView(),
      Center(child: Text("Coming Soon")), // Fixes index issue
    ];

    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),

      bottomNavigationBar: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_navItems.length, (index) {
              final navLinkItems = _navItems[index];
              final bool isActive = controller.selectedIndex.value == index;

              return Expanded(
                child: ElevatedButton(
                  onPressed: () => controller.currentPage(index),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      navLinkItems.containsKey('iconWidget')
                          ? navLinkItems['iconWidget'] // CircleAvatar
                          : SvgPicture.string(
                            navLinkItems['icon'] ?? '',
                            color:
                                isActive ? AppColor.sussessDark : Colors.black,
                            width: 24,
                            height: 24,
                          ),
                      const SizedBox(height: 2),
                      Text(
                        navLinkItems['label'] ?? '',
                        style: TextStyle(
                          fontSize: 10,
                          color: isActive ? AppColor.sussessDark : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
