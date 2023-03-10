import 'package:ecommerce/controllers/expanded_text_controller.dart';
import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/auth/signin_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home/home_screen.dart';

void main() {
  Get.lazyPut(() => ProductController());
  Get.lazyPut(() => ExpandedTextController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: "Ubuntu",
      ),
      // home: const SigninScreen(),
      initialRoute: "/home",
      routes: {
        "/signin": (context) => const SigninScreen(),
        "/signup": (context) => const SignupScreen(),
        "/home": (context) => const HomeScreen(),
        "/product_details": (context) => const ProductDetailsScreen(),
        "/cart": (context) => const CartScreen(),
      },
    );
  }
}
