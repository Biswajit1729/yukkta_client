import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  final PageController pageController = PageController();

  // Navigate to the next page or to the login screen if on the last page
  void nextPage() {
    if (currentIndex < 1) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Get.offAllNamed('/login');
    }
  }

  // Update the current index when the page changes
  void onPageChanged(int index) {
    currentIndex.value = index;
  }
}
