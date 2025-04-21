import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';
import 'package:jossy_kitchen/features/home/home_controller.dart';
import 'package:jossy_kitchen/food/food_card.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Text & Profile Picture
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Hi Joseph', style: TextStyle(color: Colors.white)),
                      Text('Welcome Back!',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                  CircleAvatar(
                      radius: 24,
                      backgroundImage:
                          AssetImage('assets/profile_image/profile_icon.png')),
                ],
              ),
              const SizedBox(height: 20),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search here for food',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 20),

              // Categories
              Obx(() => Row(
                    children: controller.categories.map((category) {
                      final isSelected =
                          controller.selectedCategory.value == category;
                      return GestureDetector(
                        onTap: () => controller.selectCategory(category),
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Colors.white : Colors.red.shade400,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              color: isSelected ? Colors.red : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )),
              const SizedBox(height: 20),

              // Food Cards
              Expanded(
                child: Obx(() => ListView.builder(
                      itemCount: controller.filteredDishes.length,
                      itemBuilder: (context, index) {
                        return FoodCard(dish: controller.filteredDishes[index]);
                      },
                    )),
              ),
              
            
            ],
          ),
        ),
      ),

      // Bottom Navigation with 4 tabs with transparent color without using obx
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        
            backgroundColor: AppColors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.black,
            currentIndex: controller.currentIndex.value,
            onTap: (index) => controller.changeTab(index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
            ],
          )),

      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: AppColors.primary,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.white,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite), label: 'Favorites'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.notifications), label: 'Notifications'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //   ],
      // ),
    );
  }
}
