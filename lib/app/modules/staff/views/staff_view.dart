import 'package:final_dromitory/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/staff_controller.dart';

class StaffView extends GetView<StaffController> {
  const StaffView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Staff History', style: TextStyle(fontSize: 20)),
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
                    "All Staff",
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
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            decoration: BoxDecoration(
              color: AppColor.sussessDark,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
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
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 10,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://img.88icon.com/download/jpg/20201108/f7db1ba5cd4fa9b1d0664c66e497610b_512_512.jpg!bg",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "ដារ៉ា វង់សិរីវត្តនា",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            SvgPicture.string(
                              SvgIcon.call,
                              width: 20,
                              height: 20,
                              color: AppColor.info,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "096 200 576",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            SvgPicture.string(
                              SvgIcon.email,
                              width: 20,
                              height: 20,
                              color: AppColor.info,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                "mansovanna2022@gmail.com",
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
