import 'package:get/get.dart';
import 'package:jossy_kitchen/features/auth/views/onboarding_screen.dart';
import 'package:jossy_kitchen/features/auth/views/signin_screen.dart';
import 'package:jossy_kitchen/features/auth/views/signup_screen.dart';
import 'package:jossy_kitchen/features/landing/views/landing_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.landing, page: () => const LandingPage()),
    GetPage(name: Routes.onboarding, page: () => OnboardingScreen()),
    GetPage(name: Routes.signIn, page: () => const SignInScreen()),
    GetPage(name: Routes.signUp, page: () => const SignUpScreen())
  ];
}

abstract class Routes {
  static const String landing = '/';
  static const String onboarding = '/onboarding';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
}
