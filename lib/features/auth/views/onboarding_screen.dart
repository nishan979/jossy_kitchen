// import 'package:flutter/material.dart';
// import 'package:jossy_kitchen/core/constants/colors.dart';

// class OnBoardingScreen extends StatelessWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           // Add your onboarding content here
//           //add image on the upper side of the screen
//           Image.asset(
//             'assets/on_boarding/on_boarding_food1.png',
//             height: 485,
//             width: 391,
//             alignment: Alignment.topCenter,
//           ),
//           Text(
//             "Delicious Meal",
//             style: TextStyle(
//               fontSize: 35,
//               fontFamily: 'Lato',
//               fontWeight: FontWeight.w900,
//               color: Colors.white,
//             ),
//           ),
//           Text("Enjoy delicious meals from",
//           style: TextStyle(
//               fontSize: 18,
//               fontFamily: 'Lato',
//               fontWeight: FontWeight.w500,
//               color: Colors.white,
//             ),),
//           Text("our trained & professional chefs",style: TextStyle(
//               fontSize: 18,
//               fontFamily: 'Lato',
//               fontWeight: FontWeight.w500,
//               color: Colors.white,
//             ),),

//         ],
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';
import 'package:jossy_kitchen/features/auth/views/onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Expanded(
            flex: 3,
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (index) => controller.currentPage.value = index,
              children: const [
                OnboardingPage1(),
                OnboardingPage2(),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            
            child: Obx(
              () => Column(
                children: [
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.totalPages,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: controller.currentPage.value == index
                              ? AppColors.white
                              : AppColors.white.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                        
                  //const Spacer(),
                        
                  const SizedBox(height: 20),
                        
                  // Next/Get Started Button
                  SizedBox(
                    height: 40,
                    width: 320,
                    child: ElevatedButton(
                      
                      onPressed: controller.nextPage,
                      style: ElevatedButton.styleFrom(
                        
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70),
                        ),
                      ),
                      child: Text(
                        controller.currentPage.value == controller.totalPages - 1
                            ? 'Get Started'
                            : 'Next',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Skip Button
                  if (controller.currentPage.value < controller.totalPages - 1)
                    TextButton(
                      onPressed: controller.skipToEnd,
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      //bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      color: Colors.amber,
      height: 100,
      padding: const EdgeInsets.all(20),
      child: Obx(
        () => Column(
          children: [
            // Page Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.totalPages,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: controller.currentPage.value == index
                        ? AppColors.primary
                        : AppColors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

            //const Spacer(),

            const SizedBox(height: 20),

            // Next/Get Started Button
            ElevatedButton(
              onPressed: controller.nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                controller.currentPage.value == controller.totalPages - 1
                    ? 'Get Started'
                    : 'Next',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 4),
            // Skip Button
            if (controller.currentPage.value < controller.totalPages - 1)
              TextButton(
                onPressed: controller.skipToEnd,
                child: Text(
                  'Skip',
                  // style: TextStyle(color: AppColors.textGrey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/on_boarding/on_boarding_food1.png',
          width: double.infinity,
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Delicious Meal',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w900,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Every delicious meals from our trained & professional client',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/on_boarding/on_boarding_food2.png',
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Tasty and Fresh',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w900,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Created from our professional chefs with fresh ingredients',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
