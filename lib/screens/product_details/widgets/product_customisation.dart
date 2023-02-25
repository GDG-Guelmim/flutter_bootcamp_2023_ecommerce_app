import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCustomisation extends StatelessWidget {
  const ProductCustomisation({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find<ProductController>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          ...List.generate(
            product.colors.length,
            (index) => GetBuilder<ProductController>(
                id: "color",
                builder: (controller) {
                  return InkWell(
                    child: ColorDot(
                      color: product.colors[index],
                      isSelected: index == controller.colorSelected,
                    ),
                    onTap: () {
                      controller.colorSelected = index;
                      controller.update(["color"]);
                    },
                  );
                }),
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundedIconBtn(
                icon: Icons.remove,
                press: () {
                  productController.decrementQuantity();
                },
              ),
              const SizedBox(width: 10),
              GetBuilder<ProductController>(builder: (controller) {
                return Text(
                  controller.productQuantity.toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                );
              }),
              const SizedBox(width: 10),
              RoundedIconBtn(
                icon: Icons.add,
                showShadow: true,
                press: () {
                  productController.incrementQuantity();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.all(8),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? Colors.orange : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key? key,
    required this.icon,
    required this.press,
    this.showShadow = false,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCancelCallback press;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          if (showShadow)
            BoxShadow(
              offset: const Offset(0, 6),
              blurRadius: 10,
              color: const Color(0xFFB0B0B0).withOpacity(0.2),
            ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: Colors.orange,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
