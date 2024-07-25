import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../home/views/home_view.dart';
import '../controllers/product2_controller.dart';

class Product2View extends GetView<Product2Controller> {
  const Product2View({Key? key}) : super(key: key);

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
              'assets/images/bike.jpg',
              width: 220,
              height: 220,
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
                        AnimatedOpacity(
                          opacity: 1.0,
                          duration: Duration(seconds: 2),
                          child: Text(
                            'Happy Food delivery in 20 minutes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ).animate()
                              .fade(duration: 700.ms)
                              .scale(delay: 700.ms),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: AnimatedOpacity(
                            opacity: 1.0,
                            duration: Duration(seconds: 2),
                            child: Text(
                              'Your order will be immediately collected and sent by our best delivery courier',
                              textAlign: TextAlign.center,
                            ).animate()
                                .fade(duration: 900.ms)
                                .scale(delay: 900.ms),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(() => HomeView(),transition: Transition.rightToLeft);
                          },
                          icon: Icon(Icons.arrow_circle_right),
                          iconSize: 40,
                        ).animate()
                            .fade(duration: 1100.ms)
                            .scale(delay: 1100.ms),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, color: Colors.grey, size: 12),
                SizedBox(width: 8),
                Icon(Icons.circle, color: Colors.blue, size: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
