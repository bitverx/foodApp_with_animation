import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/product/views/product_view.dart';
import 'app/modules/product2/views/product2_view.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: HomePage(),
    ),
  );
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          ProductView(),
          Product2View(),
        ],
      ),
    );
  }
}
