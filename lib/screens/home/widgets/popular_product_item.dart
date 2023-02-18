import 'package:flutter/material.dart';

import '../../../models/popular_product_model.dart';
import 'heart_icon_button.dart';

class PopularProductItem extends StatelessWidget {
  final PopularProductModel popularProduct;
  const PopularProductItem({
    Key? key,
    required this.popularProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Container(
              height: 130,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffEDEEF1),
              ),
              child: Image.asset(
                popularProduct.imagePath,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              popularProduct.title,
              style: const TextStyle(
                color: Color.fromARGB(255, 148, 148, 148),
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  popularProduct.price,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 143, 106),
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                HeartIconButton(isFavorite: popularProduct.isFavorite),
              ],
            )
          ],
        ));
  }
}
