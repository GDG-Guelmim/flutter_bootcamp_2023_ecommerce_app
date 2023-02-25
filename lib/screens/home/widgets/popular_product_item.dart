import 'package:ecommerce/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/product_model.dart';
import '../../product_details/product_details_screen.dart';
import 'heart_icon_button.dart';

class PopularProductItem extends StatelessWidget {
  final ProductModel popularProduct;
  const PopularProductItem({
    Key? key,
    required this.popularProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/product_details",
          arguments: ProductDetailsScreenArguments(popularProduct),
        );
      },
      child: Container(
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
                child: Hero(
                  tag: popularProduct.id,
                  child: Image.asset(
                    popularProduct.images[0],
                  ),
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
                    popularProduct.price.toStringAsFixed(2),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 143, 106),
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  GetBuilder<ProductController>(builder: (controller) {
                    return HeartIconButton(
                      isFavorite: popularProduct.isFavourite,
                      onPressed: () {
                        controller.toggleFavorite(popularProduct);
                      },
                    );
                  }),
                ],
              )
            ],
          )),
    );
  }
}
