// ignore_for_file: deprecated_member_use

import 'package:final_dromitory/app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_payment_controller.dart';

class DetailPaymentView extends GetView<DetailPaymentController> {
  const DetailPaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    final paymentStatus = Get.arguments as Map<String, dynamic>;
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
                      "ព័ត៌មានលម្អិតនៃការបង់ប្រាក់",
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
                        "ឈ្មោះ: សុវណ្ណ ដារ៉ា",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: AppFonts.battdombang,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ថ្ងៃបង់ប្រាក់៖ 17-06-2025",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFonts.battdombang,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "ចំនួនប្រាក់៖ 100,000 រៀល",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFonts.battdombang,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "ស្ថានភាព៖ ",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.battdombang,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            paymentStatus['status'] ?? 'មិនមាន',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.battdombang,
                              fontWeight: FontWeight.bold,
                              color:
                                  paymentStatus['status'] == 'Paid'
                                      ? Colors.green
                                      : AppColor.warning,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Divider(color: Colors.grey[300], thickness: 1),
                      SizedBox(height: 10),
                      Text(
                        "វិក័យប័ត្របង់ប្រាក់៖",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFonts.battdombang,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Invoice Details
                      Image.asset(
                        "assets/images/invoices.jpg",
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

  // _test() {
  //   // This is a test function to check if the code is working
  //   return Builder(
  //     builder: (context) {
  //       final invoiceImage = controller.paymentDetail['invoiceImage'];
  //       if (invoiceImage == null || invoiceImage.isEmpty) {
  //         return Container(
  //           width: double.infinity,
  //           height: 200,
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //             color: Colors.grey[100],
  //             borderRadius: BorderRadius.circular(10),
  //             border: Border.all(color: Colors.grey[300]!),
  //           ),
  //           child: const Text(
  //             "មិនមានរូបភាពវិក័យប័ត្រ",
  //             style: TextStyle(
  //               fontSize: 16,
  //               fontFamily: AppFonts.battdombang,
  //               color: Colors.grey,
  //             ),
  //           ),
  //         );
  //       }
  //       return ClipRRect(
  //         borderRadius: BorderRadius.circular(10),
  //         child: Image.network(
  //           invoiceImage,
  //           width: double.infinity,
  //           // height: 200,
  //           fit: BoxFit.cover,
  //           errorBuilder: (context, error, stackTrace) {
  //             return Container(
  //               width: double.infinity,
  //               height: 200,
  //               alignment: Alignment.center,
  //               decoration: BoxDecoration(
  //                 color: Colors.grey[100],
  //                 borderRadius: BorderRadius.circular(10),
  //                 border: Border.all(color: Colors.grey[300]!),
  //               ),
  //               child: const Text(
  //                 "មិនអាចបង្ហាញរូបភាពវិក័យប័ត្រ",
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   fontFamily: AppFonts.battdombang,
  //                   color: Colors.grey,
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
}
