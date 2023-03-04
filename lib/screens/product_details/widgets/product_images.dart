import 'package:ecommerce/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImages extends StatelessWidget {
  final List<String> images;
  final int id;
  const ProductImages({
    super.key,
    required this.images,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find<ProductController>();
    productController.init();

    return Column(
      children: [
        SizedBox(
          width: 200,
          child: AspectRatio(
            aspectRatio: 1,
            child: GetBuilder<ProductController>(builder: (controller) {
              return Hero(
                tag: id,
                child: Image.asset(images[controller.selectedImage]),
              );
            }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
            (index) => GestureDetector(
              onTap: () {
                debugPrint("clicked: $index");
                productController.selectedImage = index;
              },
              child: GetBuilder<ProductController>(builder: (controller) {
                return Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                        color: controller.selectedImage == index
                            ? Colors.orange
                            : Colors.transparent),
                  ),
                  child: Image.asset(images[index]),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
