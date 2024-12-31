import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> login() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // Handle successful login and store user data in PostgreSQL
        // Example: saveUserToDatabase(googleUser);
        Get.offAllNamed('/home');
      }
    } catch (error) {
      print(error);
      Get.snackbar('Login Failed', error.toString());
    }
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
    Get.offAllNamed('/login');
  }
}

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
