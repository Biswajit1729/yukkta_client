import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  final PageController pageController = PageController();

  void nextPage() {
    if (currentIndex < 2) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Get.offAllNamed('/login');
    }
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: Get.find<OnboardingController>().pageController,
        onPageChanged: (index) => Get.find<OnboardingController>().onPageChanged(index),
        children: const <Widget>[
          OnboardingScreen(
            title: 'Welcome to Yukkta',
            description: 'This is an amazing app to help you manage your tasks.',
          ),
          OnboardingScreen(
            title: 'Stay Organized',
            description: 'Keep track of your tasks and stay organized.',
          ),
          OnboardingScreen(
            title: 'Get Started',
            description: 'Login to start using Yukkta.',
          ),
        ],
      ),
      bottomSheet: Obx(() {
        return Container(
          height: 60,
          width: double.infinity,
          color: Colors.deepPurple,
          child: Center(
            child: TextButton(
              onPressed: () => Get.find<OnboardingController>().nextPage(),
              child: Text(
                Get.find<OnboardingController>().currentIndex.value == 2 ? 'Get Started' : 'Next',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final String title;
  final String description;

  const OnboardingScreen({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
