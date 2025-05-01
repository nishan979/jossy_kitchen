import 'package:get/get.dart';
import 'package:jossy_kitchen/features/auth/views/let_know_you.dart';
import 'package:jossy_kitchen/features/auth/views/onboarding_screen.dart';
import 'package:jossy_kitchen/features/auth/views/signin_screen.dart';
import 'package:jossy_kitchen/features/auth/views/signup_screen.dart';
import 'package:jossy_kitchen/features/bottom_nav_bar/favourite_page.dart';
import 'package:jossy_kitchen/features/bottom_nav_bar/order_history.dart';
import 'package:jossy_kitchen/features/home/home_view.dart';
import 'package:jossy_kitchen/features/landing/views/landing_page.dart';
import 'package:jossy_kitchen/features/profile/my_profile_page.dart';
import 'package:jossy_kitchen/features/profile/notfication_page.dart';
import 'package:jossy_kitchen/features/profile/password_change.dart';
import 'package:jossy_kitchen/features/profile/profile_page.dart';
import 'package:jossy_kitchen/features/profile/settings_page.dart';
import 'package:jossy_kitchen/food/bottom_payment_sheet.dart';
import 'package:jossy_kitchen/food/product_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.landing,
      page: () => const LandingPage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.onboarding,
      page: () => OnboardingPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => const SignInScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.signUp,
      page: () => const SignUpScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.letKnowYou,
      page: () => const LetKnowYou(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.product,
      page: () => ProductPage(productNo: 0),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.favourite,
      page: () => FavouritePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.paymentSheet,
      page: () => const BottomPaymentSheet(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfilePage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.myProfile,
      page: () => MyProfilePage(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: Routes.changePass,
      page: () => PasswordChange(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: Routes.notification,
      page: () => NotficationPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.settings,
      page: () => SettingsPage(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.orderHistory,
      page: () => OrderHistory(),
      transition: Transition.leftToRight,
    ),
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
  static const String paymentSheet = '/paymentSheet';
  static const String profile = '/profile';
  static const String myProfile = '/myProfile';
  static const String changePass = '/changePass';
  static const String notification = '/notification';
  static const String settings = '/settings';
  static const String orderHistory = '/orderHistory';
}
