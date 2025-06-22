import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController

  final formKey = GlobalKey<FormState>();

  final Rx<File?> selectImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  final studentIdController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final latinNameController = TextEditingController();
  final birthDateController = TextEditingController();
  final addressController = TextEditingController();
  final studentPhoneController = TextEditingController();
  final parentPhoneController = TextEditingController();
  final majorController = TextEditingController();
  final levelController = TextEditingController();
  final yearController = TextEditingController();

  var gender = ''.obs;

  @override
  void onInit() {
    // Dispose all controllers to free memory
    studentIdController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    latinNameController.dispose();
    // birthDateController.dispose();
    addressController.dispose();
    studentPhoneController.dispose();
    parentPhoneController.dispose();
    majorController.dispose();
    levelController.dispose();
    yearController.dispose();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Pick date helper
  Future<void> pickBirthDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      birthDateController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  // Picks Image from Gallary
  Future<void> pickImageGallary(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectImage.value = File(image.path);
    }
  }

  // Picks Image form Cameras
  Future<void> pickImageCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      selectImage.value = File(image.path);
    }
  }
}
