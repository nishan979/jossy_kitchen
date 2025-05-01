import 'package:flutter/material.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';

class NotficationPage extends StatelessWidget {
  const NotficationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: AppColors.white,
            fontFamily: 'Lato',
          ),
        ),
      ),
      body: ListView.builder(
        // Use ListView.builder for better performance with large lists
        
        itemCount: 10, // Example notification count
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key('notification_$index'),
            direction: DismissDirection.horizontal,
            onDismissed: (direction) {
              // Handle swipe actions
              if (direction == DismissDirection.startToEnd) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.white,
                    content: Text(
                      'Notification $index marked as read',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                );
              } else if (direction == DismissDirection.endToStart) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.white,
                    content: Text(
                      'Notification $index deleted',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                );
              }
            },
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.mark_email_read, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              title: Text('Notification $index',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                    fontFamily: 'Lato',
                  )),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      // 50% of the screen height
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Notification $index Details',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                              fontFamily: 'Lato',
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'This is the detailed view of the notification.',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                              fontFamily: 'Lato',
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
