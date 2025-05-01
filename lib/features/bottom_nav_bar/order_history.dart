import 'package:flutter/material.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Order History",
            style: TextStyle(
              color: AppColors.white,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              fontSize: 28,
            ),
            ),
            ListView.builder(
              itemCount: 5, // Replace with the actual number of orders
              itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text(
                  'Order #${index + 1}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Delivered',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Date: 2023-10-01',
                  style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Total: \$45.99',
                  style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                // Handle view details action
                  },
                  style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                  ),
                  child: const Text('View Details'),
                ),
              ],
                ),
              ),
            );
              },
            ),
          ],
        ),
      ),
    );
  }
}