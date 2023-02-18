import 'package:ecommerce/models/popular_product_model.dart';
import 'package:ecommerce/screens/home/widgets/popular_product_item.dart';
import 'package:ecommerce/screens/home/widgets/section_title.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const SectionTitle(text: "Popular Products"),
        SizedBox(
            width: double.maxFinite,
            height: 220,
            child: ListView.builder(
                itemCount: popularProductsList.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return PopularProductItem(
                    popularProduct: popularProductsList[index],
                  );
                }))
      ],
    );
  }
}
