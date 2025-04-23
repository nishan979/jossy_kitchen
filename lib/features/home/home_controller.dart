import 'package:get/get.dart';
import 'package:jossy_kitchen/food/food_model.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var selectedCategory = 'Popular'.obs;

  List<String> categories = ['Popular', 'Local', 'Intercontinental', 'Fast Food', 'Dessert'];

  List<FoodModel> allDishes = [
    FoodModel('Eba with okro soup', 'Spiced with sea fish', 3500, 'assets/food_image/Soup.png', 'Popular'),
    FoodModel('Spaghetti with chicken', 'Spiced with ugu leave', 3000, 'assets/food_image/Spaghetti.png', 'Popular'),
    FoodModel('Beans with dodo', '', 1500, 'assets/food_image/Dodo.png', 'Popular'),
    FoodModel('Jollof rice with chicken', 'Spiced with dodo', 1500, 'assets/food_image/Jollof.png', 'Popular'),
  ];

  List<FoodModel> get filteredDishes =>
      allDishes.where((dish) => dish.category == selectedCategory.value).toList();

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
