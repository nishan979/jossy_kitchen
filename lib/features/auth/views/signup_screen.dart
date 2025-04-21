import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';
import 'package:jossy_kitchen/core/routes/app_pages.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agreeToTerms = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.08), // Big top gap
                        const Text(
                          "Create an Account",
                          style: TextStyle(
                            color: AppColors.white,
                            fontFamily: 'Lato',
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Text(
                          "Sign up to continue",
                          style: TextStyle(
                            color: AppColors.white,
                            fontFamily: 'Lato',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Full Name Field
                        TextField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          // onSubmitted: (value) {
                          //   FocusScope.of(context).nextFocus();
                          // },
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            hintStyle: const TextStyle(
                              color: AppColors.primary,
                              fontFamily: 'Lato',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: AppColors.white,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 24),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Phone Number Field
                        TextField(
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: const TextStyle(
                              color: AppColors.primary,
                              fontFamily: 'Lato',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: AppColors.white,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 24),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Email Field
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                            hintStyle: const TextStyle(
                              color: AppColors.primary,
                              fontFamily: 'Lato',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: AppColors.white,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 24),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Password Field
                        TextField(
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: AppColors.primary,
                              fontFamily: 'Lato',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: AppColors.white,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 24),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Confirm Password Field
                        TextField(
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            hintStyle: const TextStyle(
                              color: AppColors.primary,
                              fontFamily: 'Lato',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: AppColors.white,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 24),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),

                        // Agree to Terms and Conditions
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: agreeToTerms,
                              onChanged: (value) {
                                setState(() {
                                  agreeToTerms = value!;
                                });
                              },
                              activeColor: Colors.white,
                              checkColor: Colors.red,
                              fillColor: WidgetStateProperty.all(Colors.white),
                              side: const BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  agreeToTerms = !agreeToTerms;
                                });
                              },
                              child: const Text(
                                "I agree to the terms and conditions",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontFamily: 'Lato',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Spacer(), // Pushes everything above to top

                        const SizedBox(height: 50),

                        // Create Account Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.offNamed(Routes.letKnowYou);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              foregroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(70),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        // just a text "Already have an account?"" Text button will be "Sign In". 
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.offNamed(Routes.signIn);
                            },
                            child: const Text(
                              "Already have an account? Sign In",
                              style: TextStyle(
                                color: AppColors.white,
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
