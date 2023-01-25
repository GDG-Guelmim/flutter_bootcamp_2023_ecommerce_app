import 'package:flutter/material.dart';

import 'screens/auth/signin_screen.dart';
import 'screens/auth/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: "Ubuntu",
      ),
      home: const SigninScreen(),
    );
  }
}
