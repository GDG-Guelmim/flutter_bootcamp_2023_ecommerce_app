import 'package:ecommerce/controllers/expanded_text_controller.dart';
import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/screens/product_details/widgets/top_rounded_corners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../widgets/expanded_text.dart';
import 'product_customisation.dart';

class ProductDetailsBody extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find<ProductController>();
    ExpandedTextController textController = Get.find<ExpandedTextController>();

    return TopRoundedCorners(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              child: Text(
                product.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                productController.toggleFavorite(product);
              },
              child: GetBuilder<ProductController>(builder: (controller) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: product.isFavourite
                        ? const Color(0xFFFFE6E6)
                        : const Color(0xFFF5F6F9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Heart Icon_2.svg",
                    color: product.isFavourite
                        ? const Color(0xFFFF4848)
                        : const Color(0xFFDBDEE4),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ExpandedText(text: product.description),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                textController.isExpanded = !textController.isExpanded;
              },
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                margin: const EdgeInsets.only(bottom: 30),
                child: Row(
                  children: [
                    GetBuilder<ExpandedTextController>(builder: (controller) {
                      return Text(
                        "See ${controller.isExpanded ? "less" : "more"} Details",
                        style: const TextStyle(
                          color: Color(0xfff77547),
                        ),
                      );
                    }),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 10,
                      color: Color(0xfff77547),
                    ),
                  ],
                ),
              ),
            ),
            TopRoundedCorners(
              color: const Color(0xFFF6F7F9),
              child: Column(
                children: [
                  ProductCustomisation(product: product),
                  TopRoundedCorners(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange,
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Add To Cart",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
