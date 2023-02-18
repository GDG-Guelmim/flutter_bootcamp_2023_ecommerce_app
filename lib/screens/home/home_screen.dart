import 'package:flutter/material.dart';

import '../../enums/menu_state.dart';
import 'widgets/cashback.dart';
import 'widgets/categories.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_nav_bar.dart';
import 'widgets/popular_products.dart';
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
              PopularProducts(),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
