import 'package:flutter/material.dart';

import 'widgets/cashback.dart';
import 'widgets/categories.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/special_offers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CustomAppBar(),
              CashBack(),
              Categories(),
              SpecialOffers(),
              // PopularProducts(),

              // here is the popular product section images paths
              // "assets/images/ps4_console_white_1.png",
              // "assets/images/Image Popular Product 2.png",
              // "assets/images/glap.png",
              // "assets/images/wireless headset.png",
            ],
          ),
        ),
      ),
    );
  }
}
