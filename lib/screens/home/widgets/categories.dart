import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import 'category_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Map<String, String>> categories = [
    //   {"iconPath": "assets/icons/Flash Icon.svg", "title": "Flash Deal"},
    //   {"iconPath": "assets/icons/Bill Icon.svg", "title": "Bill"},
    //   {"iconPath": "assets/icons/Game Icon.svg", "title": "Game"},
    //   {"iconPath": "assets/icons/Gift Icon.svg", "title": "Daily Gift"},
    //   {"iconPath": "assets/icons/Discover.svg", "title": "More"},
    // ];
    Get.find<HomeController>();

    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.all(20),
      child: GetBuilder<HomeController>(builder: (controller) {
        return controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  controller.list.length,
                  (index) => CategoryItem(
                    title: controller.list[index]["title"]!,
                    iconPath: controller.list[index]["iconPath"]!,
                  ),
                ),
              );
      }),
    );
  }
}
