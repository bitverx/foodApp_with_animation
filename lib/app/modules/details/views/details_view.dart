import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/details_controller.dart';
class FoodItem {
  final String name;
  final String image;
  final String review;
  final double price;

  FoodItem({
    required this.name,
    required this.image,
    required this.review,
    required this.price,
  });
}
class DetailsView extends GetView<DetailsController> {
  const DetailsView({Key? key}) : super(key: key);
  static final List<FoodItem> foodItems = [
    FoodItem(
      name: 'Sufi Paratha',
      image: 'assets/images/b2.jpg',
      review: '4.5 ★',
      price: 20.0,
    ),
    FoodItem(
      name: 'Zinger Burger',
      image: 'assets/images/b6.png',
      review: '4.0 ★',
      price: 30.0,
    ),
    FoodItem(
      name: 'Chicken Tikka',
      image: 'assets/images/b8.png',
      review: '4.8 ★',
      price: 25.0,
    ),
    FoodItem(
      name: 'Chicken Tikka',
      image: 'assets/images/b7.png',
      review: '4.8 ★',
      price: 25.0,
    ),
    // Add more food items as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Special Deals🔥'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body:FoodList(),
    );
  }
}
class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  final List<FoodItem> orderList = [];
  final Map<FoodItem, int> quantities = {};

  void addToOrder(FoodItem foodItem) {
    setState(() {
      if (quantities.containsKey(foodItem)) {
        quantities[foodItem] = quantities[foodItem]! + 1;
      } else {
        orderList.add(foodItem);
        quantities[foodItem] = 1;
      }
    });
  }

  void removeFromOrder(FoodItem foodItem) {
    setState(() {
      if (quantities.containsKey(foodItem) && quantities[foodItem]! > 1) {
        quantities[foodItem] = quantities[foodItem]! - 1;
      } else {
        orderList.remove(foodItem);
        quantities.remove(foodItem);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: DetailsView.foodItems.length,
            itemBuilder: (context, index) {
              final foodItem = DetailsView.foodItems[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(foodItem.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
                    SizedBox(height: 4),
                    Text('\$${foodItem.price.toStringAsFixed(2)}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                    SizedBox(height: 4),
                    Text(foodItem.review,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500)),
                    SizedBox(height: 4),
                    Image.asset(
                      foodItem.image,
                      width: 325,
                      height: 325,
                      fit: BoxFit.cover,
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => addToOrder(foodItem),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        if (orderList.isNotEmpty) ...[
          Divider(),
          Text(
            'Order List',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: orderList.length,
              itemBuilder: (context, index) {
                final foodItem = orderList[index];
                final quantity = quantities[foodItem]!;
                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      foodItem.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(foodItem.name),
                    subtitle: Text('Price: \$${foodItem.price.toStringAsFixed(2)} x $quantity'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => removeFromOrder(foodItem),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => addToOrder(foodItem),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
