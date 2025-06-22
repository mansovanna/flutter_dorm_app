import 'package:final_dromitory/app/constants/constants.dart';
import 'package:final_dromitory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/leave_history_controller.dart';

class LeaveHistoryView extends GetView<LeaveHistoryController> {
  const LeaveHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final RxString selectedStatus = 'all'.obs;
    final RxInt selectIndexStatus = 0.obs;

    // status for filter data from server
    final statusList = [
      {'title': 'មើលទាំងអស់', 'status': 'All'},
      {'title': 'រងចាំពិនិត្យ', 'status': 'Pending'},
      {'title': 'បានអនុញ្ញាត', 'status': 'Approved'},
      {'title': 'មិនអនុញ្ញាត', 'status': 'Rejected'},
    ];

    final requst_leave = [
      {
        "name": "Sovann Dara",
        "student_id": '1100332244',
        "admin": null,
        "status": "Pending",
      },
      {
        "name": "Sovann Dara",
        "student_id": '1100332244',
        "admin": "Sovanna",
        "status": "Approved",
      },
      {
        "name": "Sovann Dara",
        "student_id": '1100332244',
        "admin": "Sovanna",
        "status": "Rejected",
      },
      {
        "name": "Sovann Dara",
        "student_id": '1100332244',
        "admin": "Sovanna",
        "status": "Rejected",
      },
      {
        "name": "Sovann Dara",
        "student_id": '1100332244',
        "admin": "Sovanna",
        "status": "Approved",
      },
      {
        "name": "Sovann Dara",
        "student_id": '1100332244',
        "admin": "Sovanna",
        "status": "Approved",
      },
      {
        "name": "Sovann Dara",
        "student_id": '1100332244',
        "admin": "Sovanna",
        "status": "Approved",
      },
    ];

    // final controller = Get.put(LeaveHistoryController());
    // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Back',
          style: TextStyle(fontSize: 20, fontFamily: AppFonts.poppins),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          // padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------- Filter Chips ----------
              const SizedBox(height: 1),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(color: Colors.white),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: statusList.length,
                  itemBuilder: (context, index) {
                    final statusStore = statusList[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 7,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // -------------
                          selectedStatus.value =
                              statusStore['status'].toString();
                          selectIndexStatus.value = index;
                        },
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color:
                                  selectIndexStatus.value == index
                                      ? AppColor.sussessDark
                                      : Colors.black12,
                            ),
                            child: Center(
                              child: Text(
                                statusStore['title'].toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      selectIndexStatus.value == index
                                          ? Colors.white
                                          : AppColor.sussessDark,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // ---------- Sample Data Preview ----------
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
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
                      "4 recoed",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 95,
                      ),
                      itemCount: requst_leave.length,
                      itemBuilder: (context, index) {
                        final requestState = requst_leave[index];
                        return GestureDetector(
                          onTap: () {
                            // ----------------
                            Get.toNamed(
                              Routes.DETAIL_LEAVE,
                              arguments: {'status': requestState['status']},
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 85,
                                decoration: BoxDecoration(
                                  color:
                                      requestState['status'] == "Approved"
                                          ? AppColor.succss
                                          : requestState['status'] == 'Pending'
                                          ? AppColor.warning
                                          : AppColor.danger,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "${index + 1}",
                                    style: TextStyle(
                                      fontFamily: AppFonts.poppins,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  // width: 40,
                                  height: 85,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // --------------
                                        Text(
                                          requestState['name'].toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "លេខសម្គាល់៖ ${requestState['student_id'] ?? 'កំពុងរង់ចាំពិនិត្យ'}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          "អ្នកត្រួតពិនិត្យ៖ ${requestState['admin'] ?? 'កំពុងរង់ចាំពិនិត្យ'}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: ElevatedButton(
        onPressed: () {
          Get.bottomSheet(
            _buildFormRequest(formKey: GlobalKey<FormState>()),
            isScrollControlled: true,

            // barrierColor: Colors.amber,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.info,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "ស្នើរសុំច្បាប់",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormRequest({required GlobalKey<FormState> formKey}) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController idController = TextEditingController();
    final TextEditingController fromDateController = TextEditingController();
    final TextEditingController toDateController = TextEditingController();
    final TextEditingController daysController = TextEditingController();
    final TextEditingController reasonController = TextEditingController();

    // ignore: no_leading_underscores_for_local_identifiers
    Future<void> _selectDate(
      BuildContext context,
      TextEditingController controller,
    ) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        controller.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      }
    }

    // ignore: no_leading_underscores_for_local_identifiers
    void _calculateDaysBetween() {
      if (fromDateController.text.isNotEmpty &&
          toDateController.text.isNotEmpty) {
        try {
          final from = DateTime.parse(fromDateController.text);
          final to = DateTime.parse(toDateController.text);
          final totalDays = to.difference(from).inDays + 1;

          if (totalDays > 0) {
            daysController.text = totalDays.toString();
          } else {
            daysController.clear();
            Get.snackbar('កំហុស', 'ថ្ងៃមកវិញត្រូវធំជាងថ្ងៃឈប់');
          }
        } catch (e) {
          daysController.clear();
        }
      }
    }

    InputDecoration customInputDecoration(String label) {
      return InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(Get.context!).unfocus(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const Text(
                  "សូមបំពេញទម្រង់ស្នើរសុំច្បាប់",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Name
                TextFormField(
                  controller: nameController,
                  decoration: customInputDecoration('ឈ្មោះនិស្សិត'),
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'សូមបញ្ចូលឈ្មោះ'
                              : null,
                ),
                const SizedBox(height: 10),

                // Student ID
                TextFormField(
                  controller: idController,
                  decoration: customInputDecoration('អត្តលេខ'),
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'សូមបញ្ចូលអត្តលេខ'
                              : null,
                ),
                const SizedBox(height: 10),

                // From Date
                TextFormField(
                  controller: fromDateController,
                  readOnly: true,
                  decoration: customInputDecoration(
                    'ថ្ងៃឈប់',
                  ).copyWith(suffixIcon: Icon(Icons.calendar_today)),
                  onTap: () async {
                    await _selectDate(Get.context!, fromDateController);
                    _calculateDaysBetween();
                  },
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'សូមជ្រើសរើសថ្ងៃឈប់'
                              : null,
                ),
                const SizedBox(height: 10),

                // To Date
                TextFormField(
                  controller: toDateController,
                  readOnly: true,
                  decoration: customInputDecoration(
                    'ថ្ងៃមកវិញ',
                  ).copyWith(suffixIcon: Icon(Icons.calendar_today)),
                  onTap: () async {
                    await _selectDate(Get.context!, toDateController);
                    _calculateDaysBetween();
                  },
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'សូមជ្រើសរើសថ្ងៃមកវិញ'
                              : null,
                ),
                const SizedBox(height: 10),

                // Number of Days (auto)
                TextFormField(
                  controller: daysController,
                  readOnly: true,
                  decoration: customInputDecoration('ចំនួនថ្ងៃឈប់សរុប'),
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'សូមជ្រើសរើសថ្ងៃឈប់ និងថ្ងៃមកវិញ'
                              : null,
                ),
                const SizedBox(height: 10),

                // Reason
                TextFormField(
                  controller: reasonController,
                  maxLines: 3,
                  decoration: customInputDecoration('មូលហេតុ'),
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'សូមបញ្ចូលមូលហេតុ'
                              : null,
                ),
                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Get.back();
                        Get.snackbar(
                          'ជោគជ័យ',
                          'បានបញ្ជូនសំណើររួចរាល់',
                          backgroundColor: AppColor.sussessDark,
                          colorText: Colors.white,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.info,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'បញ្ជូនសំណើរ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
