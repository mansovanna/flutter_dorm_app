// import 'package:final_dromitory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../constants/constants.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //   -----------
                        Image.asset("assets/images/profile.png", width: 140),

                        const SizedBox(height: 35),

                        Text(
                          "ប្រព័ន្ធសុំច្បាប់អន្ដេវាសិកដ្ឋាន",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFonts.moul,
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          "សូមបំពេញព័ត៌មានដើម្បីចូលប្រើប្រាស់គណនីរបស់អ្នក",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontFamily: AppFonts.battdombang,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Obx(() {
                          return TextFormField(
                            controller: controller.studentIdController,
                            decoration: InputDecoration(
                              hintText: "លេខសម្គាល់និស្សិត",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                              ),
                              errorText:
                                  controller.isStudentIdValide.value
                                      ? null
                                      : "Invalid student ID",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: AppColor.primary,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: AppColor.danger,
                                ),
                              ),
                              prefixIcon: HugeIcon(
                                icon: HugeIcons.strokeRoundedUser,
                                color: Colors.black,
                                size: 24.0,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter id";
                              }
                              return null;
                            },
                          );
                        }),

                        const SizedBox(height: 10),
                        Obx(
                          () => TextFormField(
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                              hintText: "ពាក្សសម្ងាត់",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                              ),
                              errorText:
                                  controller.isPasswordValide.value
                                      ? null
                                      : "Invalid password",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: AppColor.primary,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: AppColor.danger,
                                ),
                              ),
                              prefixIcon: HugeIcon(
                                icon: HugeIcons.strokeRoundedSquareLock02,
                                color: Colors.black,
                                size: 24.0,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  //   ------------------
                                  controller.showPass();
                                  // print(controller.isShowPass.value);
                                },
                                icon:
                                    controller.isShowPass.value
                                        ? HugeIcon(
                                          icon:
                                              HugeIcons
                                                  .strokeRoundedViewOffSlash,
                                          color: Colors.black,
                                          size: 24.0,
                                        )
                                        : HugeIcon(
                                          icon: HugeIcons.strokeRoundedView,
                                          color: AppColor.danger,
                                          size: 24.0,
                                        ),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                            ),
                            obscureText: controller.isShowPass.value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter password";
                              }
                              return null;
                            },
                          ),
                        ),

                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  //
                                  FocusScope.of(context).unfocus();
                                  if (controller.formKey.currentState
                                          ?.validate() ??
                                      false) {
                                    // TODO: Implement save logic
                                    final studentIdText =
                                        controller.studentIdController.text;
                                    final password =
                                        controller.passwordController.text;

                                    controller.login(
                                      studentId: studentIdText.trim(),
                                      password: password.trim(),
                                    );
                                  } else {
                                    // Show validation errors
                                    controller.isStudentIdValide.value =
                                        controller
                                            .studentIdController
                                            .text
                                            .isNotEmpty &&
                                        controller
                                                .studentIdController
                                                .text
                                                .length >=
                                            5;
                                    controller.isPasswordValide.value =
                                        controller
                                            .passwordController
                                            .text
                                            .isNotEmpty &&
                                        controller
                                                .passwordController
                                                .text
                                                .length >=
                                            6;
                                  }

                                  // Get.offAllNamed(Routes.HOME);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.info,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Obx(() {
                                    return controller.isLoading.value
                                        ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              "កំពុងដំណើរការ...",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        )
                                        : Text(
                                          "ចូលគណនី",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        );
                                  }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
