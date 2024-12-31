import 'package:get/get.dart';

import '../../index.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/onboarding', page: () => const OnboardingPage()),
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/profile_setup', page: () => const ProfileSetupPage()),
    GetPage(name: '/home', page: () => const MyHomePage(title: 'Yukkta Home Page')),
  ];
}
