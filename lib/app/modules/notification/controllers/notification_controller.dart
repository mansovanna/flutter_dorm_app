// ignore_for_file: invalid_use_of_protected_member

import 'package:final_dromitory/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  // ------------------------------------------------
  final List<Map<String, String>> notifications = [
    {
      'title': 'អន្តេវាសិកដ្ឋាន',
      'body':
          'សូមជម្រាបជូនដំណឹងដល់អ្នកប្រើប្រាស់គ្រប់រូបថា ការអាប់ដេតនៃប្រព័ន្ធនឹង ត្រូវបានអនុវត្តនៅថ្ងៃ ថ្ងៃអង្គារ ទី 18 ខែមិថុនា ឆ្នាំ 2025 ចាប់ពីម៉ោង  11:00 ព្រឹក ដល់ 12:00 រសៀល។ ក្នុងអំឡុងពេលនោះ អ្នកប្រើប្រាស់ ប្រព័ន្ធអាចនឹងជួប ការរាំងស្ទះ បណ្តោះអាសន្ន សូមអភ័យទោសចំពោះ ការរអាក់រអួល! សូមអរគុណសម្រាប់ការយល់ដឹង និងសហការរបស់លោក អ្នក។ សូមអគុណ',
      'dateTime': '2023-10-01',
    },
    {
      'title': 'ការបង់ប្រាក់',
      'body': 'អ្នកបានបង់ប្រាក់សំរាប់ខែតុលា',
      'dateTime': '2023-10-02',
    },
    {
      'title': 'ព័ត៌មានប្រចាំថ្ងៃ',
      'body': 'សូមអានព័ត៌មានថ្មីៗអំពីអន្តេវាសិកដ្ឋាន',
      'dateTime': '2023-10-03',
    },
    {
      'title': 'កែប្រែពត៌មាន',
      'body': 'សូមធ្វើបច្ចុប្បន្នភាពលើព័ត៌មានផ្ទាល់ខ្លួនរបស់អ្នក',
      'dateTime': '2023-10-04',
    },
    {
      'title': 'ការផ្ញើសារ',
      'body': 'អ្នកទទួលបានសារថ្មីពីអ្នកគ្រប់គ្រង',
      'dateTime': '2023-10-05',
    },
    {
      'title': 'ការណែនាំថ្មី',
      'body': 'សូមអានការណែនាំថ្មីនៃការស្នាក់នៅ',
      'dateTime': '2023-10-06',
    },
    {
      'title': 'ព្រឹត្តិការណ៍ជិតមកដល់',
      'body': 'សូមចូលរួមព្រឹត្តិការណ៍កំសាន្តស្អែកនេះ',
      'dateTime': '2023-10-07',
    },
    {
      'title': 'បិទប្រព័ន្ធ',
      'body': 'ប្រព័ន្ធនឹងបិទសម្រាប់ការថែទាំក្នុងម៉ោង ១១យប់',
      'dateTime': '2023-10-08',
    },
    {
      'title': 'ចូលដំណើរការ',
      'body': 'អ្នកបានចូលប្រព័ន្ធដោយជោគជ័យ',
      'dateTime': '2023-10-09',
    },
    {
      'title': 'ការផ្ទៀងផ្ទាត់',
      'body': 'សូមផ្ទៀងផ្ទាត់អត្តសញ្ញាណរបស់អ្នកជាថ្មី',
      'dateTime': '2023-10-10',
    },
  ];

  var selectedNotification = {}.obs;

  final count = 0.obs;
  @override
  void onInit() {
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

  void showNotificationDetail(String title, String body, String dateTime) {
    selectedNotification.value = {
      'title': title,
      'body': body,
      'dateTime': dateTime,
    };

    Get.bottomSheet(
      DraggableScrollableSheet(
        initialChildSize: 0.45,
        minChildSize: 0.3,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.sussessDark,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white12,
                        child: SvgPicture.string(
                          SvgIcon.notification,
                          width: 24,
                          height: 24,
                          color: Colors.amber.shade600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'ព័ត៍មានលម្អិត',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          selectedNotification.value['title'] ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Divider(thickness: 1),
                        const SizedBox(height: 8),

                        // Body
                        Text(
                          selectedNotification.value['body'] ?? '',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            fontFamily: AppFonts.battdombang,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Divider(thickness: 1),
                        const SizedBox(height: 8),

                        // Date
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'កាលបរិច្ឆេទ៖ ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  selectedNotification.value['dateTime'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppFonts.poppins,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      isScrollControlled: true,
    );
  }
}
