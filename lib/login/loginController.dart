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
        Get.offAllNamed('/profile_setup');
      }
    } catch (error) {
      print('Login error: $error');
      Get.snackbar('Login Failed', error.toString());
    }
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
    Get.offAllNamed('/login');
  }

  Future<bool> isLoggedIn() async {
    return await _googleSignIn.isSignedIn();
  }
}
