import 'package:final_dromitory/app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rules_controller.dart';

class RulesView extends GetView<RulesController> {
  const RulesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Rules', style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Rules",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.poppins,
                    ),
                  ),
                  Text(
                    "20 record",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontFamily: AppFonts.poppins,
                    ),
                  ),
                ],
              ),

              // -------------------
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.sussessDark,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            "បទបញ្ជារផ្ទៃក្នុងសម្រាប់អន្តេវាសិដ្ឋាន",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "ប្រការ១ គោលបំណង \nបទបញ្ហានេះអនុវត្តចំពោះនិស្សិតទាំងឡាយដែលកំពុងស្នាក់នៅក្នុងអន្តេវាសិកដ្ឋានវិទ្យាស្ថានបច្ចេកវិទ្យា ដល់អ្នក កំពង់ស្ពឺ ធ្វើឲ្យយល់ដឹងពីគោលការណ៍ក្នុងការស្នាក់នៅក្នុងអគ្គវាសិកដ្ឋានរបស់វិទ្យាស្ថាន បណ្តុះបណ្តាលបស់ ស្នាក់នៅទាំងឡាយគួរបុគ្គលិកលក្ខណៈក្នុងការរស់នៅជាមួយគ្នានិងធ្វើឲ្យអ្នកដែលរស់នៅ ចែករំលែកវប្បធម៌ សន្តិភាពដែលអាចទទួលបាននូវសុខសុវត្ថិភាពទាំងអស់គ្នា ជាមួយគ្នាបោះផ្លាស់ប្តូរ",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
