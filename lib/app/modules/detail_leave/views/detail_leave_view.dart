import 'package:final_dromitory/app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_leave_controller.dart';

class DetailLeaveView extends GetView<DetailLeaveController> {
  const DetailLeaveView({super.key});
  @override
  Widget build(BuildContext context) {
    final String? status = Get.arguments['status'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Back',
          style: TextStyle(fontSize: 20, fontFamily: AppFonts.poppins),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // ---------
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 200,
                      decoration: BoxDecoration(
                        color:
                            status == 'Approved'
                                ? AppColor.succss
                                : status == 'Pending'
                                ? AppColor.warning.withOpacity(0.8)
                                : AppColor.danger,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppFonts.poppins,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // -------------------
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // -----
                          Text(
                            "សុវណ្ណ ដារ៉ា",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),
                          Text(
                            "ID: 11002233",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "ជំនាញ៖ បច្ចេកវិទ្យាកំពង់ស្ពឺ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),

                          Text(
                            "ចំនួនថ្ងៃ៖ ២០",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),

                          Text(
                            "ថ្ងៃ-ខែ-ឆ្នាំ៖ 30-05-2025 → 04-072025",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),

                          Text(
                            "មូលហេតុ៖ ទៅលេងស្រុក",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),

                          Text(
                            "បានពិនិត្យដោយ៖ Sovanna",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),

                          Text(
                            "ស្ថានភាព៖ បានអនុញ្ញាត",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                        ],
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
