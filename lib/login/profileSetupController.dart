import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSetupController extends GetxController {
  final branchController = TextEditingController();
  final pgNameController = TextEditingController();
  final contactNumberController = TextEditingController();

  void submitProfile() {
    // Save the profile data to the database
    // Example: saveProfileToDatabase(branchController.text, pgNameController.text, contactNumberController.text);
    Get.offAllNamed('/home');
  }
}
