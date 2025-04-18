import 'package:flutter/material.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';
import 'package:get/get.dart';
import 'package:jossy_kitchen/features/auth/views/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: controller.onboardingData.length,
              itemBuilder: (context, index) {
                final item = controller.onboardingData[index];
                return Column(
                  children: [
                    Expanded(
                        child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                      child: Image.asset(
                        item.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )),
                    SizedBox(height: 8),
                    // Title and Subtitle
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            item.titile,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w900,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            item.subtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          // end expanded
          SizedBox(height: 35),
          // Page Indicators
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.onboardingData.length,
                  (indexDot) => GestureDetector(
                    onTap: () => controller.pageController.animateToPage(
                      indexDot,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    ),
                    child: AnimatedContainer(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      duration: const Duration(milliseconds: 300),
                      width: controller.currentPage.value == indexDot ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              )),
          SizedBox(height: 35),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () {
                  if (controller.currentPage.value <
                      controller.onboardingData.length - 1) {
                    controller.pageController.animateToPage(
                      controller.currentPage.value + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    controller.finishOnboarding();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ),
                  minimumSize: Size(double.infinity, 48),
                ),
                child: Text(
                  controller.currentPage.value ==
                          controller.onboardingData.length - 1
                      ? "Get Started"
                      : "Next",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          TextButton(
            onPressed: controller.skip,
            child: Text(
              "Skip",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
