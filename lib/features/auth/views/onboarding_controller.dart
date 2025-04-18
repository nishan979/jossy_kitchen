import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jossy_kitchen/core/routes/app_pages.dart';

class OnboardingModel {
  final String image, titile, subtitle;
  OnboardingModel(
      {required this.image, required this.titile, required this.subtitle});
}

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  final List<OnboardingModel> onboardingData = [
    OnboardingModel(
      image: "assets/on_boarding/on_boarding_food1.png",
      titile: "Delicious Meal",
      subtitle: "Enjoy delicious meals from our trained & professional chefs",
    ),
    OnboardingModel(
      image: "assets/on_boarding/on_boarding_food2.png",
      titile: "Tasty and Fresh",
      subtitle: "Order from our numerous exquisite foods",
    ),
  ];

  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      pageController.animateToPage(
        currentPage.value + 1,
        duration: Duration(microseconds: 300),
        curve: Curves.ease,
      );
    } else {
      finishOnboarding();
    }
  }

  void skip() {
    finishOnboarding();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void finishOnboarding() {
    Get.offAllNamed(Routes.signIn);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
