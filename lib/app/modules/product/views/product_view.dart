import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../product2/views/product2_view.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 30),
        child: Column(
          children: [
            Image.asset(
              'assets/images/food1.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ).animate()
                .fade(duration: 500.ms)
                .scale(delay: 500.ms),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 300,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Order Your Favourites Japanese Food',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ).animate()
                            .fade(duration: 700.ms)
                            .scale(delay: 700.ms),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'When you order, we\'ll hook you up with exclusive coupons and special offers',
                            textAlign: TextAlign.center,
                          ).animate()
                              .fade(duration: 900.ms)
                              .scale(delay: 900.ms),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: IconButton(
                            onPressed: () {
                              Get.to(() => Product2View(),transition: Transition.leftToRight);
                            },
                            icon: Icon(Icons.arrow_circle_right),
                            iconSize: 40,
                          ).animate()
                              .fade(duration: 1100.ms)
                              .scale(delay: 1100.ms),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, color: Colors.blue, size: 12),
                SizedBox(width: 8),
                Icon(Icons.circle, color: Colors.grey, size: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
