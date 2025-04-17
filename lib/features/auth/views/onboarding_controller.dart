import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jossy_kitchen/core/routes/app_pages.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final int totalPages = 2;

  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      pageController.nextPage(
        duration: 300.milliseconds,
        curve: Curves.easeInOut,
      );
      currentPage.value++;
    } else {
      Get.offAllNamed(Routes.signIn);
    }
  }

  void skipToEnd() {
    Get.offAllNamed(Routes.signIn);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}