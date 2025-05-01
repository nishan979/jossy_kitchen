import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';
import 'package:jossy_kitchen/core/routes/app_pages.dart';
import 'package:jossy_kitchen/features/bottom_nav_bar/cart_page.dart';
import 'package:jossy_kitchen/features/bottom_nav_bar/favourite_page.dart';
import 'package:jossy_kitchen/features/bottom_nav_bar/home_page.dart';
import 'package:jossy_kitchen/features/bottom_nav_bar/order_history.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    FavouritePage(),
    CartPage(),
    OrderHistory(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,

      // --------app bar----------
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Jossy Kitchen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
            fontFamily: 'Lato',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 8),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.profile);
              },
              child: CircleAvatar(
                radius: 24,
                backgroundImage:
                    AssetImage('assets/profile_image/profile_icon.png'),
              ),
            ),
          ),
        ],
      ),

      // -----------body-----------
      body: _pages[_selectedIndex],
      // -----------bottom navigation bar-----------
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: AppColors.white,
          elevation: 0,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
