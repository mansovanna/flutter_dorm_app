import 'package:final_dromitory/app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/stays_history_controller.dart';

class StaysHistoryView extends GetView<StaysHistoryController> {
  const StaysHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Stays History', style: TextStyle(fontSize: 20)),
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
                    "All Stays",
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
              const SizedBox(height: 10),
              _buildBox(),
              const SizedBox(height: 10),
              _buildBox(),
              const SizedBox(height: 10),
              _buildBox(),
              const SizedBox(height: 10),
              _buildBox(),
              const SizedBox(height: 10),
              _buildBox(),
              const SizedBox(height: 10),
              _buildBox(),
              const SizedBox(height: 10),
              _buildBox(),
              const SizedBox(height: 10),
              _buildBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBox() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                decoration: BoxDecoration(
                  color: AppColor.sussessDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontFamily: AppFonts.roboto,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              //
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ចូលស្នាក់នៅថ្ងៃទី៖ 20-06-24",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text("អាគារ៖ NT-02", style: TextStyle(fontSize: 14)),
                    Text("លេខបន្ទប់៖ 9", style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
