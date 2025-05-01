import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';
import 'package:jossy_kitchen/food/bottom_payment_sheet.dart';

class OrderSummaryPage extends StatelessWidget {
  final formatter = NumberFormat('#,##0.00', 'en_NG');
  final int total;
  final int deliveryFee;
  final List<Map<String, dynamic>> cartItems;

  OrderSummaryPage({
    super.key,
    required this.cartItems,
    this.deliveryFee = 100,
  }) : total = cartItems.fold(
          0,
          (sum, item) =>
              sum +
              ((item['price'] as num) * (item['quantity'] as num)).toInt(),
        );

  @override
  Widget build(BuildContext context) {
    final totalAmount = total + deliveryFee;

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Order',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
            fontFamily: 'Lato',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Delivery Address",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                TextButton(
                  onPressed: () {},
                  child:
                      const Text("Edit", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            // Shopping Address
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.white),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Oke Joseph",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("+2348133165489",
                          style: TextStyle(color: Colors.white70)),
                      SizedBox(height: 5),
                      Text(
                        "22. Gadol street, off mobile\nfilling station, ifako ijaiye, lagos state",
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Order Summary",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ),
            const SizedBox(height: 10),

            // Dynamically list cart items
            for (var item in cartItems)
              _buildOrderItem(
                item['title'] ?? '',
                item['description'] ?? '',
                item['image'] ?? '',
                item['price'] ?? 0,
                item['quantity'] ?? 1,
              ),

            const SizedBox(height: 20),
            _buildPriceRow("Total", total),
            _buildPriceRow("Delivery Fee", deliveryFee),
            _buildPriceRow("Total Amount", totalAmount, isTotal: true),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                    const BottomPaymentSheet(),
                    isScrollControlled: true,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text("Make Payment",
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 22,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String title, String description, String imagePath,
      int price, int quantity) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath,
                width: 70, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    fontSize: 20,
                  ),
                ),
                Text(description,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
                Text('₦${formatter.format(price)}',
                    style: const TextStyle(color: AppColors.primary)),
              ],
            ),
          ),
          Text("+$quantity",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, int amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                  color: Colors.white)),
          Text('₦${formatter.format(amount)}',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                  color: Colors.white)),
        ],
      ),
    );
  }
}
