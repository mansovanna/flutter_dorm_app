// ignore_for_file: deprecated_member_use

import 'package:final_dromitory/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/request_pay_controller.dart';

class RequestPayView extends GetView<RequestPayController> {
  const RequestPayView({super.key});
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.sussessDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      "Scan QR Code ដើម្បីបង់ប្រាក់",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: AppFonts.battdombang,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // Information Section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ----------------
                      Text(
                        "ចំនួនទឹកប្រាក់ត្រូវបង់សរុបគឺ៖ 12000",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: AppFonts.battdombang,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),

                      Divider(color: Colors.grey[300], thickness: 1),
                      SizedBox(height: 10),

                      // QR Code Details
                      Image.asset(
                        "assets/images/qr_bank.jpg",
                        width: double.infinity,
                        // height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height: 200,
                            color: Colors.grey.shade200,
                            alignment: Alignment.center,
                            child: Text(
                              'មិនអាចបង្ហាញរូបភាពបាន',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),

                      // ----
                      SizedBox(height: 10),
                      Divider(color: Colors.grey[300], thickness: 1),
                      SizedBox(height: 10),
                      Align(
                        child: Text(
                          "សូមធ្វើការស្កេន QR Code ដើម្បីបង់ប្រាក់",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppFonts.battdombang,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ប្រសិនបើអ្នកបានបង់ប្រាក់រួចរាល់ សូមផ្ញើរវិក័យប័ត្រមកកាន់យើង ដើម្បីពិនិត្យ និងផ្ទៀងផ្ទាត់បញ្ជាក់ភាពត្រឹមត្រូវរបស់អ្នក តាមការ Upload ខាងក្រោម សូមអគុណ។",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFonts.battdombang,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 10),
                      // form pick invoice form camera or gallery
                      Text(
                        "សូមជ្រើសរើសរូបភាពវិក័យប័ត្រដែលអ្នកបានបង់ប្រាក់ 👇",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFonts.battdombang,
                          color: Colors.grey[900],
                        ),
                      ),
                      SizedBox(height: 10),
                      // Upload Image Section
                      GestureDetector(
                        onTap: () async {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (context) {
                              return Container(
                                // padding: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: AppColor.sussessDark,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "ជ្រើសរើសរូបភាពវិក័យប័ត្រ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: AppFonts.battdombang,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ListTile(
                                      leading: SvgPicture.string(
                                        SvgIcon.camera,
                                        width: 24,
                                        height: 24,
                                        color: Colors.grey[700],
                                      ),
                                      title: Text(
                                        "កាំមេរ៉ា",
                                        style: TextStyle(
                                          fontFamily: AppFonts.battdombang,
                                        ),
                                      ),
                                      onTap: () async {
                                        Navigator.pop(context);
                                        await controller.pickImageFromCamera();
                                      },
                                    ),
                                    Divider(height: 1, color: Colors.grey[300]),
                                    ListTile(
                                      leading: SvgPicture.string(
                                        SvgIcon.image,
                                        width: 24,
                                        height: 24,
                                        color: Colors.grey[700],
                                      ),
                                      title: Text(
                                        "វិចិត្រសាល",
                                        style: TextStyle(
                                          fontFamily: AppFonts.battdombang,
                                        ),
                                      ),
                                      onTap: () async {
                                        Navigator.pop(context);
                                        await controller.pickImageFromGallery(
                                          context,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Obx(() {
                          final image = controller.selectedImage.value;
                          return image != null
                              ? Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey[400]!),
                                ),
                                child: Image.file(
                                  image,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              )
                              : Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey[400]!),
                                ),
                                child: Center(
                                  child: SvgPicture.string(
                                    SvgIcon.upload,
                                    width: 70,
                                    height: 70,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              );
                        }),
                      ),
                      SizedBox(height: 20),
                      // Button to upload image
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                // Submit the selected image
                                if (controller.selectedImage.value != null) {
                                  // Here you can handle the image upload logic
                                  Get.snackbar(
                                    "Success",
                                    "Invoice uploaded successfully!",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green[400],
                                    colorText: Colors.black,
                                  );
                                } else {
                                  Get.snackbar(
                                    "Error",
                                    "Please select an invoice image first.",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red[400],
                                    colorText: Colors.black,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primary,
                                padding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "ផ្ញើរវិក័យប័ត្រ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppFonts.battdombang,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
}
