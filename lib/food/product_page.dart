import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';
import 'package:jossy_kitchen/features/home/home_controller.dart';
import 'package:jossy_kitchen/food/product_data.dart';

class ProductPage extends StatefulWidget {
  //final ProductPage dish;
  final int productNo;
  const ProductPage({super.key, required this.productNo});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final HomeController controller = Get.put(HomeController());

  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = productList[widget.productNo];
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                  child:
                      // add an image to the top of the page
                     Image.asset(product['image'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      product['title'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: AppColors.white,
                        fontFamily: 'Lato',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product['description'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                        fontFamily: 'Lato',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '₦${product['price']}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                        fontFamily: 'Lato',
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: decreaseQuantity,
                                icon: Icon(Icons.remove_circle_outline),
                                color: AppColors.white,
                              ),
                              Text(
                                '$quantity',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              IconButton(
                                onPressed: increaseQuantity,
                                icon:
                                    Icon(Icons.add_circle_outline, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            IconButton(
                              onPressed: () {
                                // Add to favourite
                              },
                              icon: Icon(Icons.favorite_border),
                              color: AppColors.white,
                              
                            ),
                          ],),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Add to cart button
                    ElevatedButton(
                      onPressed: () {
                        // Add to cart
                        // controller.addToCart(product);
                        // Get.snackbar(
                        //   'Added to Cart',
                        //   '${product['title']} has been added to your cart',
                        //   backgroundColor: AppColors.white,
                        //   colorText: AppColors.primary,
                        //   duration: Duration(seconds: 2),
                        // );
                      },
                      style: ElevatedButton.styleFrom(

                        backgroundColor: AppColors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        minimumSize: Size(double.infinity, 48),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),

                  ],
                ),
              ),

            ],
          ),
          Positioned(
            top: 16,
            left: 5,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.primary,
              onPressed: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}
