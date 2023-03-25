import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/controllers/expanded_text_controller.dart';
import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/product_details/product_details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'screens/auth/signin_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home/home_screen.dart';

// bool isOnboardingScreenSeen = false;

void main() async {
  Get.lazyPut(() => ProductController(), fenix: true);
  Get.lazyPut(() => ExpandedTextController(), fenix: true);
  Get.lazyPut(() => AuthController(), fenix: true);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  //  isOnboardingScreenSeen =
  //     prefs.getBool('isOnboardingScreenSeen') ?? false;

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
      // initialRoute: isOnboardingScreenSeen ? "/signin" : "/onboardingscreen",
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? "/signin" : "/home",
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
