import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';
import 'package:jossy_kitchen/core/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: AppColors.white,
            fontFamily: 'Lato',
          ),
        ),
      ),
      body: ListView(
        children: [
          _buildSettingsOption(
            context,
            icon: Icons.language,
            title: 'Language',
            onTap: () {
              showDialogBox(context, "Change Language",
                  "Language change functionality is not implemented yet.");
            },
          ),
          _buildSettingsOption(
            context,
            icon: Icons.brightness_6,
            title: 'Theme',
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  bool isDarkMode =
                      Theme.of(context).brightness == Brightness.dark;
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        title: const Text(
                          "Theme",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                          ),
                        ),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Dark Mode",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            ),
                            Switch(
                              value: isDarkMode,
                              onChanged: (value) {
                                setState(() {
                                  isDarkMode = value;
                                });
                                Get.changeTheme(
                                  isDarkMode
                                      ? ThemeData.dark()
                                      : ThemeData.light(),
                                );
                              },
                              activeColor: AppColors.primary,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(70),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
          _buildSettingsOption(
            context,
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  bool isNotificationEnabled = false; // Initial state
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        title: const Text(
                          "Notifications",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                          ),
                        ),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Enable Notifications",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            ),
                            Switch(
                              value: isNotificationEnabled,
                              onChanged: (value) {
                                setState(() {
                                  isNotificationEnabled = value;
                                });
                              },
                              activeColor: AppColors.primary,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(70),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
          _buildSettingsOption(
            context,
            icon: Icons.privacy_tip,
            title: 'Privacy Policy',
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.5,
                    minChildSize: 0.3,
                    maxChildSize: 0.9,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Privacy Policy",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "This is a dummy privacy policy. "
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                                "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                                "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
                                "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
                                "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. "
                                "\n\n"
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                                "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                                "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
                                "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
                                "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          _buildSettingsOption(
            context,
            icon: Icons.article,
            title: 'Terms and Conditions',
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.5,
                    minChildSize: 0.3,
                    maxChildSize: 0.9,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Terms and Conditions",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "These are dummy terms and conditions. "
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                                "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                                "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
                                "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
                                "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. "
                                "\n\n"
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                                "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                                "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
                                "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
                                "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          _buildSettingsOption(
            context,
            icon: Icons.info,
            title: 'About Us',
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      "About Us",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                    content: const Text(
                      "Jossy Kitchen is a platform dedicated to providing the best recipes and cooking tips. "
                      "Our mission is to make cooking enjoyable and accessible for everyone. "
                      "Thank you for being a part of our journey!",
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
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          _buildSettingsOption(
            context,
            icon: Icons.help,
            title: 'Help & Support',
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.6,
                    minChildSize: 0.4,
                    maxChildSize: 0.9,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Help & Support",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              const SizedBox(height: 16),
                              ListTile(
                                leading: const Icon(Icons.email,
                                    color: AppColors.primary),
                                title: const Text(
                                  "Contact Us",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                subtitle: const Text(
                                  "support@jossykitchen.com",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                onTap: () {
                                  void launchEmail() async {
                                    final Uri emailUri = Uri(
                                      scheme: 'mailto',
                                      path: 'support@jossykitchen.com',
                                      query:
                                          'subject=Support Request&body=Hello, I need help with...',
                                    );

                                    if (await canLaunchUrl(emailUri)) {
                                      await launchUrl(emailUri);
                                    } else {
                                      throw 'Could not launch $emailUri';
                                    }
                                  }

                                  // Call this function in the onTap
                                  launchEmail();
                                },
                              ),
                              const Divider(),
                              ListTile(
                                leading: const Icon(Icons.phone,
                                    color: AppColors.primary),
                                title: const Text(
                                  "Call Us",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                subtitle: const Text(
                                  "+880 163 466 4389",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                onTap: () {
                                  void launchDialer() async {
                                    final Uri phoneUri = Uri(
                                      scheme: 'tel',
                                      path: '+8801634664389',
                                    );

                                    if (await canLaunchUrl(phoneUri)) {
                                      await launchUrl(phoneUri);
                                    } else {
                                      throw 'Could not launch $phoneUri';
                                    }
                                  }

                                  // Call this function in the onTap
                                  launchDialer();
                                },
                              ),
                              const Divider(),
                              ListTile(
                                leading: const Icon(Icons.chat,
                                    color: AppColors.primary),
                                title: const Text(
                                  "Live Chat",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                onTap: () {
                                  void launchLiveChat() async {
                                    final Uri chatUri = Uri(
                                      scheme: 'https',
                                      host: 'example.com',
                                      path: '/livechat',
                                    );

                                    if (await canLaunchUrl(chatUri)) {
                                      await launchUrl(chatUri, mode: LaunchMode.externalApplication);
                                    } else {
                                      throw 'Could not launch $chatUri';
                                    }
                                  }

                                  launchLiveChat();
                                },
                              ),
                              const Divider(),
                              ListTile(
                                leading: const Icon(Icons.help_outline,
                                    color: AppColors.primary),
                                title: const Text(
                                  "FAQs",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                onTap: () {
                                  void showFAQDialog(BuildContext context) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          title: const Text(
                                            "FAQs",
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                            ),
                                          ),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ExpansionTile(
                                                  title: const Text(
                                                    "What is Jossy Kitchen?",
                                                    style: TextStyle(
                                                      fontFamily: 'Lato',
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                                      child: Text(
                                                        "Jossy Kitchen is a platform dedicated to providing the best recipes and cooking tips for everyone.",
                                                        style: TextStyle(
                                                          fontFamily: 'Lato',
                                                          fontSize: 16,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ExpansionTile(
                                                  title: const Text(
                                                    "How can I contact support?",
                                                    style: TextStyle(
                                                      fontFamily: 'Lato',
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                                      child: Text(
                                                        "You can contact support via email at support@jossykitchen.com or call us at +880 163 466 4389.",
                                                        style: TextStyle(
                                                          fontFamily: 'Lato',
                                                          fontSize: 16,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ExpansionTile(
                                                  title: const Text(
                                                    "Is Jossy Kitchen free to use?",
                                                    style: TextStyle(
                                                      fontFamily: 'Lato',
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                                      child: Text(
                                                        "Yes, Jossy Kitchen is completely free to use. Enjoy our recipes and tips without any cost!",
                                                        style: TextStyle(
                                                          fontFamily: 'Lato',
                                                          fontSize: 16,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: AppColors.primary,
                                                foregroundColor: AppColors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(70),
                                                ),
                                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                              ),
                                              child: const Text(
                                                'Close',
                                                style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }

                                  // Call this function in the onTap
                                  showFAQDialog(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          _buildSettingsOption(
            context,
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
                showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: const Text(
                    "Logout",
                    style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    ),
                  ),
                  content: const Text(
                    "Are you sure you want to log out?",
                    style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    ),
                  ),
                  actions: [
                    TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      ),
                    ),
                    ),
                    TextButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.signIn);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      ),
                    ),
                    ),
                  ],
                  );
                },
                );
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> showDialogBox(
      BuildContext context, String title, String content) {
    // final String title = 'Change Language';
    // final String content =
    //     'Language change functionality is not implemented yet.';

    // get value of title and content from the user

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.green,
            ),
          ),
          content: Text(
            content,
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
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSettingsOption(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
