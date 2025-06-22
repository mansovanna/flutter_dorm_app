import 'package:final_dromitory/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Back',
          style: TextStyle(fontSize: 20, fontFamily: AppFonts.poppins),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All History Leave",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.poppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "0 records",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppFonts.poppins,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.notifications.length,
              itemBuilder: (context, index) {
                final notification = controller.notifications[index];
                return _buildNotificationItem(
                  title: notification['title'] ?? '',
                  body: notification['body'] ?? '',
                  dateTime: notification['dateTime'] ?? '',
                );
              },
            ),
            const SizedBox(height: 10),
            // Add more space at the bottom
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String body,
    required String dateTime,
  }) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Colors.white,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.amber.shade600,
              child: SvgPicture.string(
                SvgIcon.notification,
                width: 24,
                height: 24,
                color: Colors.white,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                body,
                style: TextStyle(fontSize: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey.shade400,
            ),
            onTap: () {
              // Handle tap action
              // Get.snackbar(
              //   'Notification',
              //   'You tapped on: $title',
              //   snackPosition: SnackPosition.BOTTOM,
              //   duration: const Duration(seconds: 2),
              // );
              controller.showNotificationDetail(title, body, dateTime);
            },
          ),
        ),

        Positioned(
          top: 14,
          right: 25,
          child: Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              // Display the date and time
              Text(
                dateTime,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
