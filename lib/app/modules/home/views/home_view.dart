import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_delivery/app/modules/details/views/details_view.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  static final List<Map<String, String>> products = [
    {
      'image': 'assets/images/im1.jpg', // Replace with your image assets
      'title': 'Sufi Paratha',
      'review': '4.5 ★',
      'price': '\$20',
    },
    {
      'image': 'assets/images/im2.jpg',
      'title': 'Zinger burger',
      'review': '4.0 ★',
      'price': '\$30',
    },
    {
      'image': 'assets/images/im3.jpg',
      'title': 'Chicken tika',
      'review': '4.8 ★',
      'price': '\$25',
    },
    {
      'image': 'assets/images/im4.jpg',
      'title': 'grill kawab',
      'review': '4.2 ★',
      'price': '\$22',
    },
    {
      'image': 'assets/images/im5.jpg',
      'title': 'Pasta',
      'review': '4.2 ★',
      'price': '\$22',
    },
    {
      'image': 'assets/images/im6.jpg',
      'title': 'half fry egg',
      'review': '4.2 ★',
      'price': '\$22',
    },
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(backgroundColor: Colors.grey.shade300,
                        child: Icon(Icons.account_circle,size: 40,)),
                  ),
                  Text('Hi,Nanas\nwhat do you want to eat',
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Icon(Icons.notifications_active),
                    ),
                ],
              ),
            ).animate()
                .fade(duration: 500.ms)
                .scale(delay: 500.ms),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'search for food',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  )
                ),
              ),
            ).animate()
                .fade(duration: 700.ms)
                .scale(delay: 700.ms),
      Container(
        width: 350,
        child: Card(
          margin: EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/im8.jpg'), // Replace with your background image
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'Special Deal🔥',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ).animate()
                  .fade(duration: 900.ms)
                  .scale(delay: 900.ms),
                  Text('50% OFF',
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,).animate()
                      .fade(duration: 1000.ms)
                      .scale(delay: 1000.ms),
                Text('and get free delivery',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,).animate()
                    .fade(duration: 1100.ms)
                    .scale(delay: 1100.ms),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(()=>DetailsView());
                    },
                    child: Text('Order Now').animate()
                        .fade(duration: 1200.ms)
                        .scale(delay: 1200.ms),
                  ),
                ],
              ),
            ),
          ),
        ),
      ).animate()
          .fade(duration: 700.ms)
          .scale(delay: 700.ms),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Row(
                children: [
                  Text('Popular food',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Text('See All'),
                  ),
                ],
              ),
            ).animate()
                .fade(duration: 1300.ms)
                .scale(delay: 1300.ms),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: products.length, // Replace with your actual item count
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      image: product['image']!,
                      title: product['title']!,
                      review: product['review']!,
                      price: product['price']!,
                    );
                  },
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String review;
  final String price;

  const ProductCard({
    required this.image,
    required this.title,
    required this.review,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ).animate()
                  .fade(duration: 1400.ms)
                  .scale(delay: 1400.ms),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ).animate()
                    .fade(duration: 1500.ms)
                    .scale(delay: 1500.ms),
                SizedBox(height: 4),
                Text(
                  review,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ).animate()
                    .fade(duration: 1600.ms)
                    .scale(delay: 1600.ms),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ).animate()
                        .fade(duration: 1700.ms)
                        .scale(delay: 1700.ms),
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        // Handle cart icon press
                      },
                    ).animate()
                        .fade(duration: 1800.ms)
                        .scale(delay: 1800.ms),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
