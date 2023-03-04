import 'package:ecommerce/controllers/expanded_text_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandedText extends StatelessWidget {
  const ExpandedText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    ExpandedTextController controller = Get.find<ExpandedTextController>();

    String firstPart = "";
    String secondPart = "";

    if (text.length > 160) {
      firstPart = text.substring(0, 160);
      secondPart = text.substring(160, text.length);
      controller.isExpandable = true;
      controller.isExpanded = false;
    } else {
      firstPart = text;
      secondPart = "";
      controller.isExpandable = false;
      controller.isExpanded = false;
    }

    return SizedBox(
      width: double.maxFinite,
      child: GetBuilder<ExpandedTextController>(builder: (controller) {
        return Text(
          controller.isExpanded
              ? (firstPart + secondPart)
              : (firstPart + (controller.isExpandable ? " ..." : "")),
          style: const TextStyle(
            color: Colors.grey,
            height: 1.8,
          ),
        );
      }),
    );
  }
}

// if (condition) aaaaa else bbbbb <==> condition ? aaaaa : bbbbbb