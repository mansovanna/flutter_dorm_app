import 'package:final_dromitory/app/constants/constants.dart';
import 'package:final_dromitory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_history_controller.dart';

class PaymentHistoryView extends GetView<PaymentHistoryController> {
  const PaymentHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    final payment_request = [
      {
        'year': '2025',
        'amount': '120000',
        'status': 'Paid',
        'date': '2024-01-01',
        'id': '1',
      },
      {
        'year': '2024',
        'amount': '100000',
        'status': 'Unpaid',
        'date': '2023-01-01',
        'id': '2',
      },
      {
        'year': '2023',
        'amount': '80000',
        'status': 'Pending',
        'date': '2022-01-01',
        'id': '3',
      },
      {
        'year': '2022',
        'amount': '60000',
        'status': 'Paid',
        'date': '2021-01-01',
        'id': '4',
      },
      // Add more payment requests as needed
    ];
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All History Leave",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: AppFonts.poppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "${payment_request.length} records",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppFonts.poppins,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              // Add your payment history list here
              // For example, you can use ListView.builder to show a list of payments
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount:
                    payment_request
                        .length, // Replace with your actual data length
                itemBuilder: (context, index) {
                  final payment = payment_request[index];
                  // Replace with your actual payment data model
                  // Example of how to display each payment item
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        // Handle tap on payment item
                        // You can navigate to a detailed view or perform any action
                        if (payment['status'] == 'Unpaid' ||
                            payment['status'] == null) {
                          Get.toNamed(
                            Routes.REQUEST_PAY,
                            arguments: {
                              'year': payment['year'],
                              'amount': payment['amount'],
                              'id': payment['id'],
                            },
                          );
                        } else {
                          Get.toNamed(
                            Routes.DETAIL_PAYMENT,
                            arguments: {
                              'year': payment['year'],
                              'amount': payment['amount'],
                              'status': payment['status'],
                              'date': payment['date'],
                              'id': payment['id'],
                            },
                          );
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  // --------
                                  Text(
                                    "${index + 1}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AppFonts.poppins,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                        payment['status'] == 'Paid'
                                            ? AppColor.succss
                                            : payment['status'] == 'Unpaid'
                                            ? Colors.grey.shade400
                                            : AppColor.warning,
                                    child: Icon(
                                      Icons.attach_money_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),

                                  SizedBox(width: 10),
                                  // --------
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "បង់សម្រាប់ឆ្នាំ ${payment['year']}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: AppFonts.battdombang,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        "សរុប៖ ${payment['amount'] ?? 'រងចាំទាន់បានពិនិត្យ'} រៀល",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: AppFonts.poppins,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        "ស្ថានភាព៖ ${payment['status'] ?? 'មិនទាន់បានបង់'}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: AppFonts.poppins,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
