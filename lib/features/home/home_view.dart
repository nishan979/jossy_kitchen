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
        child: Stack(
          children: [
            SingleChildScrollView(
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
                            Text(
                              'Hi Joseph',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white,
                                fontFamily: 'Lato',
                              ),
                            ),
                            Text(
                              'Welcome Back!',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(
                                'assets/profile_image/profile_icon.png')),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Search Bar
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        hintText: 'Search here for food',
                        hintStyle: TextStyle(
                          color: AppColors.primary,
                          fontSize: 20,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                        ),
                        filled: true,
                        fillColor: AppColors.white,
                        //make prefix icon some right padding
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 5),
                          child: Icon(
                            Icons.search,
                            color: AppColors.primary,
                            size: 27,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Text("Categories",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                          fontFamily: 'Lato',
                        )),
                    const SizedBox(height: 10),

                    // Categories
                    Obx(() => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: controller.categories.map((category) {
                              final isSelected =
                                  controller.selectedCategory.value == category;
                              return GestureDetector(
                                onTap: () =>
                                    controller.selectCategory(category),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 12),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.white
                                        : Colors.red.shade400,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    category,
                                    style: TextStyle(
                                      color: isSelected
                                          ? AppColors.primary
                                          : AppColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        )),
                    const SizedBox(height: 20),
                    // Cagetory Text // Category Text for displaying the selected category
                    Obx(() => Text(
                          controller.selectedCategory.value,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                            fontFamily: 'Lato',
                          ),
                        )),
                    const SizedBox(height: 10),

                    // Food Cards with two food cards in a row
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Obx(() => GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.68,
                              crossAxisSpacing: 25,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: controller.filteredDishes.length,
                            itemBuilder: (context, index) {
                              return FoodCard(
                                  dish: controller.filteredDishes[index]);
                            },
                          )),
                    ),
                    // Expanded(
                    //   child: Obx(() => ListView.builder(
                    //         itemCount: controller.filteredDishes.length,
                    //         itemBuilder: (context, index) {
                    //           return FoodCard(dish: controller.filteredDishes[index]);
                    //         },
                    //       )),
                    // ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 30,
              right: 30,
              bottom: 16,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 60,
                  minHeight: 55,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Center(
                  
                  child: Obx(
                    () => BottomNavigationBar(
                      iconSize: 25,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: AppColors.primary,
                      unselectedItemColor: Colors.black,
                      currentIndex: controller.currentIndex.value,
                      onTap: (index) => controller.changeTab(index),
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: ''),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.favorite), label: ''),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.shopping_cart), label: ''),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.list), label: ''),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation with 4 tabs with transparent color which is in a white rounded box

      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(left: 30, right: 30, bottom: 16),
      //   child: Container(
      //     //alignment: Alignment.center,

      //     height: 55,
      //     decoration: BoxDecoration(
      //       color: AppColors.white,
      //       borderRadius: const BorderRadius.all(Radius.circular(30)),
      //       boxShadow: [
      //         BoxShadow(
      //           color: Colors.black.withOpacity(0.1),
      //           blurRadius: 10,
      //           offset: const Offset(0, -2),
      //         ),
      //       ],
      //     ),
      //     child: Obx(
      //       () => BottomNavigationBar(
      //         iconSize: 25,
      //         elevation: 0,
      //         backgroundColor: Colors.blue,
      //         type: BottomNavigationBarType.fixed,
      //         selectedItemColor: AppColors.primary,
      //         unselectedItemColor: Colors.black,
      //         currentIndex: controller.currentIndex.value,
      //         onTap: (index) => controller.changeTab(index),
      //         items: const [
      //           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      //           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
      //           BottomNavigationBarItem(
      //               icon: Icon(Icons.shopping_cart), label: ''),
      //           BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
