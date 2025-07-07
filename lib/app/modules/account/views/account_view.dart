import 'package:final_dromitory/app/constants/constants.dart';

import 'package:final_dromitory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  AccountView({super.key});

  final controller = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Profile', style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // ----------------
              _buildBoxProfile(),

              const SizedBox(height: 15),

              // ---------------------
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ------------
                      Text(
                        "General",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontFamily: AppFonts.poppins,
                        ),
                      ),

                      // -----------------------
                      GestureDetector(
                        onTap: () {
                          // ------------
                          Get.toNamed(Routes.EDIT_PROFILE);
                        },
                        child: _buildBoxNavItems(
                          title: "Edit Profile",
                          subtitle: "Change profile picture, id,...",
                          icon: SvgIcon.edit,
                          color: AppColor.primary,
                        ),
                      ),

                      Divider(height: 1),
                      GestureDetector(
                        onTap: () {
                          // ------------
                          _buildChangePass(_formKey);
                        },
                        child: _buildBoxNavItems(
                          title: "Change Password",
                          subtitle: "Update and strengthen account security",
                          icon: SvgIcon.lock,
                          color: AppColor.danger,
                        ),
                      ),

                      Divider(height: 1),
                      GestureDetector(
                        onTap: () {
                          // ------------
                          Get.toNamed(Routes.LEAVE_HISTORY);
                        },
                        child: _buildBoxNavItems(
                          title: "Leave Request History",
                          subtitle: "View your leave requested history",
                          icon: SvgIcon.order,
                          color: AppColor.primary,
                        ),
                      ),

                      Divider(height: 1),
                      GestureDetector(
                        onTap: () {
                          // ------------
                          Get.toNamed(Routes.PAYMENT_HISTORY);
                        },
                        child: _buildBoxNavItems(
                          title: "Payment History",
                          subtitle: "View your payment history",
                          icon: SvgIcon.card,
                          color: AppColor.primary,
                        ),
                      ),

                      Divider(height: 1),
                      GestureDetector(
                        onTap: () {
                          // ------------
                          Get.toNamed(Routes.NOTIFICATION);
                        },
                        child: _buildBoxNavItems(
                          title: "Notification History",
                          subtitle: "View notification history",
                          icon: SvgIcon.notification,
                          color: AppColor.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // -----
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ------------
                      Text(
                        "Preferences",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontFamily: AppFonts.poppins,
                        ),
                      ),

                      // -----------------------
                      _buildBoxNavItems2(
                        title: "Log Out",
                        subtitle: "Security log out of Account",
                        icon: SvgIcon.lock,
                        color: AppColor.danger,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBoxProfile() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage:
                  controller.imageUrl.isNotEmpty
                      ? NetworkImage(
                        '$baseUrlImage/${controller.imageUrl.string}',
                      )
                      : const AssetImage('assets/images/profile.png')
                          as ImageProvider,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${controller.username}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  "ID: ${controller.student_id}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBoxNavItems({
    required String title,
    required String subtitle,
    required String icon,
    required Color color,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.08),
        child: SvgPicture.string(icon, width: 24, height: 24, color: color),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontFamily: AppFonts.poppins,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          fontFamily: AppFonts.poppins,
          color: Colors.grey,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),

      trailing: SvgPicture.string(
        SvgIcon.arrowRight,
        width: 24,
        height: 24,
        color: Colors.black,
      ),
    );
  }

  Widget _buildBoxNavItems2({
    required String title,
    required String subtitle,
    required String icon,
    required Color color,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.08),
        child: SvgPicture.string(icon, width: 24, height: 24, color: color),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontFamily: AppFonts.poppins,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          fontFamily: AppFonts.poppins,
          color: Colors.grey,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),

      trailing: SvgPicture.string(
        SvgIcon.arrowRight,
        width: 24,
        height: 24,
        color: Colors.black,
      ),
      onTap: controller.logout,
    );
  }

  Future _buildChangePass(_formKey) {
    return Get.bottomSheet(
      isScrollControlled: true,
      Container(
        padding: EdgeInsets.only(
          bottom:
              MediaQuery.of(
                Get.context!,
              ).viewInsets.bottom, // ⬅️ handles keyboard
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          // ⬅️ allows scroll if content is long
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.sussessDark,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      "ផ្លាស់ប្ដូរលេខសម្ងាត់",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Old password
                      _buildPasswordField(
                        label: "លេខសម្ងាត់ចាស់",
                        hint: "សូមបំពេញលេខសម្ងាត់ចាស់របស់អ្នក",
                      ),

                      const SizedBox(height: 10),

                      // New password
                      _buildPasswordField(
                        label: "លេខសម្ងាត់ថ្មី",
                        hint: "សូមបំពេញលេខសម្ងាត់ថ្មីរបស់អ្នក",
                      ),

                      const SizedBox(height: 10),

                      // Confirm password
                      _buildPasswordField(
                        label: "បញ្ជាក់លេខសម្ងាត់",
                        hint: "សូមបំពេញលេខសម្ងាត់ម្ដងទៀត",
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If valid, proceed with password change
                            print("Form is valid. Proceed.");
                          } else {
                            // If invalid, do nothing or show error
                            print("Form is invalid.");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                          backgroundColor: AppColor.primary,
                          iconColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          "ប្ដូរឥឡូវនេះ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 5),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey[600],
              fontFamily: AppFonts.battdombang,
              fontSize: 14,
            ),
            filled: true,
            fillColor: AppColor.slate,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
          ),
          style: const TextStyle(fontSize: 14, fontFamily: AppFonts.poppins),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'សូមបញ្ចូលលេខសម្ងាត់';
            }
            return null;
          },
        ),
      ],
    );
  }
}
