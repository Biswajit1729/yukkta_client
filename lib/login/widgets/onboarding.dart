import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:yukkta/index.dart';

import '../index.dart';
import '../../common/buttons/button1.dart';

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
            description: 'This is an amazing app to help you manage medical needs, including medicine delivery \nand consultations.',
            imageUrl: 'https://biswajit1729.github.io/yukkta/logo.png',
          ),
          OnboardingScreen(
            title: 'Stay Organized',
            description: 'Keep track of your tasks and stay organized.',
            imageUrl: 'https://biswajit1729.github.io/yukkta/slide1.png',
          ),
        ],
      ),
      bottomSheet: Obx(() {
        return ReusableViewProfileButton(
          properties: ButtonViewProfileProperties(
            height: 60,
            width: MediaQuery.of(context).size.width,
            text: Get.find<OnboardingController>().currentIndex.value == 2 ? 'Get Started' : 'Next',
            textSize: 16,
            radius: 8,
          ),
          onPressed: () => Get.find<OnboardingController>().nextPage(),
        );
      }).paddingAll(20),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const OnboardingScreen({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: imageUrl,
              height: 200,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
