import 'package:final_dromitory/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Back',
            style: TextStyle(fontSize: 20, fontFamily: AppFonts.poppins),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    clipBehavior: Clip.none,
                    children: [
                      Obx(() {
                        final image = controller.selectImage.value;

                        return image != null
                            ? CircleAvatar(
                              radius: 60,
                              backgroundImage: FileImage(image),
                            )
                            : CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                              ),
                            );
                      }),
                      Positioned(
                        right: -10,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              //   ---------
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
                                                fontFamily:
                                                    AppFonts.battdombang,
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
                                            await controller.pickImageCamera();
                                          },
                                        ),
                                        Divider(
                                          height: 1,
                                          color: Colors.grey[300],
                                        ),
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
                                            await controller.pickImageGallary(
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
                            style: IconButton.styleFrom(
                              backgroundColor: AppColor.info,
                              padding: const EdgeInsets.all(0),
                            ),
                            icon: SvgPicture.string(
                              SvgIcon.camera,
                              width: 24,
                              height: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // អត្តលេខនិស្សិត (Student ID)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'អត្តលេខនិស្សិត',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.battdombang,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'សូមបញ្ចូលអត្តលេខនិស្សិត',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលអត្តលេខនិស្សិត';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // នាមត្រកូល (Last Name)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'នាមត្រកូល',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.battdombang,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'សូមបញ្ចូលនាមត្រកូល',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលនាមត្រកូល';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // នាមខ្លួន (First Name)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'នាមខ្លួន',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.battdombang,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'សូមបញ្ចូលនាមខ្លួន',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលនាមខ្លួន';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // អក្សរឡាតាំង (Latin Name)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'អក្សរឡាតាំង​',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.battdombang,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'សូមបញ្ចូលអក្សរឡាតាំង​',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលអក្សរឡាតាំង​';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // ភេទ (Gender)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ភេទ',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.battdombang,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      items: [
                        DropdownMenuItem(value: 'ប្រុស', child: Text('ប្រុស')),
                        DropdownMenuItem(value: 'ស្រី', child: Text('ស្រី')),
                      ],
                      onChanged: (value) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមជ្រើសរើសភេទ';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ថ្ងៃ-ខែ-ឆ្នាំ កំណើត',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.battdombang,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: controller.birthDateController,
                      decoration: InputDecoration(
                        hintText: 'សូមជ្រើសរើសថ្ងៃ-ខែ-ឆ្នាំ កំណើត',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: const Icon(Icons.calendar_today),
                      ),
                      // readOnly: true,
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          final formattedDate =
                              "${pickedDate.day.toString().padLeft(2, '0')}/"
                              "${pickedDate.month.toString().padLeft(2, '0')}/"
                              "${pickedDate.year}";
                          controller.birthDateController.text = formattedDate;
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលថ្ងៃ-ខែ-ឆ្នាំ កំណើត';
                        }
                        return null;
                      },
                    ),
                    // Add other form fields here
                  ],
                ),
                const SizedBox(height: 16),

                // អាស័ដ្ឋាន (Address)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'អាស័ដ្ឋាន',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.battdombang,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'សូមបញ្ចូលអាស័ដ្ឋាន',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលអាស័ដ្ឋាន';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // លេខទូរស័ព្ទរបស់និស្សិត (Student Phone)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'លេខទូរស័ព្ទរបស់និស្សិត',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.battdombang,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'សូមបញ្ចូលលេខទូរស័ព្ទរបស់និស្សិត',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលលេខទូរស័ព្ទរបស់និស្សិត';
                        }
                        if (!RegExp(r'^[0-9]{8,12}$').hasMatch(value)) {
                          return 'លេខទូរស័ព្ទមិនត្រឹមត្រូវ';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // លេខទូរស័ព្ទអាណាព្យាបាល (Parent Phone)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'លេខទូរស័ព្ទអាណាព្យាបាល',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.battdombang,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'សូមបញ្ចូលលេខទូរស័ព្ទអាណាព្យាបាល',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលលេខទូរស័ព្ទអាណាព្យាបាល';
                        }
                        if (!RegExp(r'^[0-9]{8,12}$').hasMatch(value)) {
                          return 'លេខទូរស័ព្ទមិនត្រឹមត្រូវ';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // ជំនាញ (Major)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ជំនាញ',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.battdombang,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'សូមបញ្ចូលជំនាញ',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលជំនាញ';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // កម្រិតសិក្សា (Education Level)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'កម្រិតសិក្សា',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.battdombang,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'សូមបញ្ចូលកម្រិតសិក្សា',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលកម្រិតសិក្សា';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // ឆ្នាំ (Year)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ឆ្នាំ',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.battdombang,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'សូមបញ្ចូលឆ្នាំ',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលឆ្នាំ';
                        }
                        if (int.tryParse(value) == null) {
                          return 'សូមបញ្ចូលលេខត្រឹមត្រូវ';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Save Button
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState?.validate() ??
                              false) {
                            // TODO: Implement save logic
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: const Text(
                            'រក្សាទុក',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
      ),
    );
  }
}
