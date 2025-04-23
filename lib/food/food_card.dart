import 'package:flutter/material.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';
import 'package:jossy_kitchen/food/food_model.dart';

class FoodCard extends StatelessWidget {
  final FoodModel dish;

  const FoodCard({required this.dish});

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                dish.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //const SizedBox(height: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 5),
                  child: Text(
                    dish.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 22,
                        height: 0.9,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary),
                  ),
                ),
                //const SizedBox(height: 4),
                Text(dish.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary)),
                const SizedBox(height: 3),
                Text(
                  '₦${dish.price}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
