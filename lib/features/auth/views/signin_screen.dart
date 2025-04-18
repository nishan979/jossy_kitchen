import 'package:flutter/material.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: Text("Sign In Page"),),
    );
  }
}