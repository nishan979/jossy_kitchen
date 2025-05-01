import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';
import 'package:jossy_kitchen/core/routes/app_pages.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
          title: const Text(
            'My Profile',
            style: TextStyle(
              color: AppColors.white,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primary),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // profile picture
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Image.asset(
                'assets/profile_image/profile_image.png',
              ),
            ),
          ),
          //SizedBox(height: 15,),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: AppColors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // necessary info
                    SizedBox(
                      height: 25,
                    ),
                    TextField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Shahadat Hosen Nishan',
                        hintStyle: const TextStyle(
                          color: AppColors.white,
                          fontFamily: 'Lato',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        filled: true,
                        fillColor: AppColors.primary,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 24),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: '+8801634664389',
                        hintStyle: const TextStyle(
                          color: AppColors.white,
                          fontFamily: 'Lato',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        filled: true,
                        fillColor: AppColors.primary,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 24),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'nishanshish@gmail.com',
                        hintStyle: const TextStyle(
                          color: AppColors.white,
                          fontFamily: 'Lato',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        filled: true,
                        fillColor: AppColors.primary,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 24),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(70),
                          ),
                          child: DropdownButton<int>(
                          value: 25,
                          onChanged: (int? newValue) {
                            // Handle age selection
                          },
                          underline: SizedBox(),
                          dropdownColor: AppColors.primary,
                          items: List.generate(
                            100,
                            (index) => DropdownMenuItem<int>(
                            value: index + 1,
                            child: Text(
                              '${index + 1} years',
                              style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                              ),
                            ),
                            ),
                          ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: DropdownButton<String>(
                            value: 'Male',
                            onChanged: (String? newValue) {
                              // Handle gender selection
                            },
                            underline: SizedBox(),
                            dropdownColor: AppColors.primary,
                            items: ['Male', 'Female', 'Other']
                                .map((gender) => DropdownMenuItem<String>(
                                      value: gender,
                                      child: Text(
                                        gender,
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.changePass);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            'Reset Password',
                            style: TextStyle(
                              color: AppColors.white,
                              fontFamily: 'Lato',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
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
                                'Profile Updated',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green,
                                ),
                              ),
                              content: Text(
                                'Your profile has been successfully updated.',
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
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
                          'Update Profile',
                          style: TextStyle(
                            color: AppColors.white,
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
            ),
          )
        ],
      ),
    );
  }
}
