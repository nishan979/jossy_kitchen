import 'package:get/get.dart';
import 'package:jossy_kitchen/features/auth/views/favourite/favourite_page.dart';
import 'package:jossy_kitchen/features/auth/views/let_know_you.dart';
import 'package:jossy_kitchen/features/auth/views/onboarding_screen.dart';
import 'package:jossy_kitchen/features/auth/views/signin_screen.dart';
import 'package:jossy_kitchen/features/auth/views/signup_screen.dart';
import 'package:jossy_kitchen/features/home/home_view.dart';
import 'package:jossy_kitchen/features/landing/views/landing_page.dart';
import 'package:jossy_kitchen/food/product_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.landing, page: () => const LandingPage()),
    GetPage(name: Routes.onboarding, page: () => OnboardingPage()),
    GetPage(name: Routes.signIn, page: () => const SignInScreen()),
    GetPage(name: Routes.signUp, page: () => const SignUpScreen()),
    GetPage(name: Routes.letKnowYou, page: () => const LetKnowYou()),
    GetPage(name: Routes.home, page: () => HomeView()),
    GetPage(name: Routes.product, page: () => ProductPage(productNo: 0,)),
    GetPage(name: Routes.favourite, page: () => PreFavouritePage()),
  ];
}

abstract class Routes {
  static const String landing = '/';
  static const String onboarding = '/onboarding';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String letKnowYou = '/letKnowYou';
  static const String home = '/home';
  static const String product = '/product';
  static const String favourite = '/prefavourite';
}
