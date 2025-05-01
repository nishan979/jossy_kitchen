import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';
import 'package:jossy_kitchen/core/routes/app_pages.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool rememberMe = false;

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
                          "Welcome Back!",
                          style: TextStyle(
                            color: AppColors.white,
                            fontFamily: 'Lato',
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Text(
                          "Sign in to continue",
                          style: TextStyle(
                            color: AppColors.white,
                            fontFamily: 'Lato',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Username Field
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Username',
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

                        // Sign In Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // goto let you know screen
                              Get.offNamed(Routes.home);
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
                              "SIGN IN",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Remember Me & Forgotten Password
                        Row(
                          children: [
                            Checkbox(
                              
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value!;
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
                                  rememberMe = !rememberMe;
                                });
                              },
                              child: const Text(
                                "Remember me",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgotten Password?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Spacer(), // Pushes everything above to top

                        // Connect Text
                        const Center(
                          child: Text(
                            "You can connect with us",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Lato',
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Social Icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Icon(FontAwesomeIcons.whatsapp,
                                  color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(FontAwesomeIcons.facebookF,
                                  color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            CircleAvatar(
                              backgroundColor: Colors.purple,
                              child: Icon(FontAwesomeIcons.instagram,
                                  color: Colors.white),
                            ),
                          ],
                        ),

                        const SizedBox(height: 50),

                        // Create Account Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.signUp);
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
                              "Create an Account",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
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
