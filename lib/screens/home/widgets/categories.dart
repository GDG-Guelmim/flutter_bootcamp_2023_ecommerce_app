import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'category_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> categories = [
      {"iconPath": "assets/icons/Flash Icon.svg", "title": "Flash Deal"},
      {"iconPath": "assets/icons/Bill Icon.svg", "title": "Bill"},
      {"iconPath": "assets/icons/Game Icon.svg", "title": "Game"},
      {"iconPath": "assets/icons/Gift Icon.svg", "title": "Daily Gift"},
      {"iconPath": "assets/icons/Discover.svg", "title": "More"},
    ];

    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryItem(
            title: categories[index]["title"]!,
            iconPath: categories[index]["iconPath"]!,
          ),
        ),
      ),
    );
  }
}
