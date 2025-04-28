import 'package:flutter/material.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';
import 'package:jossy_kitchen/features/bottom_nav_bar/favourite_card.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  favouriteCard(
                    title: "Eba with okro soap",
                    subtitle: "Spiced with sea fish",
                    price: "₦3,500",
                    imagePath: "assets/food_image/Soup.png",
                  ),
                  SizedBox(height: 12),
                  favouriteCard(
                    title: "Spaghetti with chicken",
                    subtitle: "Spiced with ugu leave",
                    price: "₦3,000",
                    imagePath: "assets/food_image/Spaghetti.png",
                  ),
                  SizedBox(height: 12),
                  favouriteCard(
                    title: "Spaghetti with chicken",
                    subtitle: "Spiced with ugu leave",
                    price: "₦3,000",
                    imagePath: "assets/food_image/Spaghetti.png",
                  ),
                  SizedBox(height: 12),
                  favouriteCard(
                    title: "Spaghetti with chicken",
                    subtitle: "Spiced with ugu leave",
                    price: "₦3,000",
                    imagePath: "assets/food_image/Spaghetti.png",
                  ),
                  SizedBox(height: 12),
                  favouriteCard(
                    title: "Spaghetti with chicken",
                    subtitle: "Spiced with ugu leave",
                    price: "₦3,000",
                    imagePath: "assets/food_image/Spaghetti.png",
                  ),
                  SizedBox(height: 12),
                  favouriteCard(
                    title: "Spaghetti with chicken",
                    subtitle: "Spiced with ugu leave",
                    price: "₦3,000",
                    imagePath: "assets/food_image/Spaghetti.png",
                  ),
                  SizedBox(height: 12),
                  favouriteCard(
                    title: "Spaghetti with chicken",
                    subtitle: "Spiced with ugu leave",
                    price: "₦3,000",
                    imagePath: "assets/food_image/Spaghetti.png",
                  ),
                  SizedBox(height: 12),
                  favouriteCard(
                    title: "Spaghetti with chicken",
                    subtitle: "Spiced with ugu leave",
                    price: "₦3,000",
                    imagePath: "assets/food_image/Spaghetti.png",
                  ),
                  SizedBox(height: 12),
                  favouriteCard(
                    title: "Spaghetti with chicken",
                    subtitle: "Spiced with ugu leave",
                    price: "₦3,000",
                    imagePath: "assets/food_image/Spaghetti.png",
                  ),
                  
                ],
              ),
            ),
          ),
          // add to cart button looks not user friendly
          // Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          //     child: ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: Colors.white,
          //         foregroundColor: Colors.red,
          //         shape: StadiumBorder(),
          //         minimumSize: Size(double.infinity, 50),
          //       ),
          //       onPressed: () {},
          //       child: Text(
          //         "Add to cart",
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
