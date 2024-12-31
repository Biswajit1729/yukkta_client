import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class ProfileSetupPage extends StatelessWidget {
  const ProfileSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileSetupController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Setup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller.branchController,
              decoration: const InputDecoration(labelText: 'Branch'),
            ),
            TextField(
              controller: controller.pgNameController,
              decoration: const InputDecoration(labelText: 'PG Name'),
            ),
            TextField(
              controller: controller.contactNumberController,
              decoration: const InputDecoration(labelText: 'Contact Number'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.submitProfile,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
