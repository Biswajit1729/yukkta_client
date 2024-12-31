import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.find<LoginController>().login(),
          child: const Text('Login with Google'),
        ),
      ),
    );
  }
}
