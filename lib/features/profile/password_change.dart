import 'package:flutter/material.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';

class PasswordChange extends StatelessWidget {
  const PasswordChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
          color: AppColors.white,
          fontFamily: 'Lato',
        ),
        title: const Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontFamily: 'Lato',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your current password',
                hintStyle: const TextStyle(
                  color: AppColors.primary,
                  fontFamily: 'Lato',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(70),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'New Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontFamily: 'Lato',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your new password',
                hintStyle: const TextStyle(
                  color: AppColors.primary,
                  fontFamily: 'Lato',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(70),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            const Text(
              'Confirm New Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontFamily: 'Lato',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Re-enter your new password',
                hintStyle: const TextStyle(
                  color: AppColors.primary,
                  fontFamily: 'Lato',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(70),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // Showing dialog box that profile updated
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Password Changed',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                        ),
                      ),
                      content: Text(
                        'Your password has been changed successfully.',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Center(
                child: Text(
                  'Update Password',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
