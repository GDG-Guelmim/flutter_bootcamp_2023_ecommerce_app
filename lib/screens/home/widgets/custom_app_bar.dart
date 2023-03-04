import 'package:flutter/material.dart';

import 'custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 100,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Search product",
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CustomIconButton(
            iconPath: "assets/icons/Cart Icon.svg",
            onTap: () {
              Navigator.pushNamed(context, "/cart");
            },
          ),
          const SizedBox(width: 10),
          const CustomIconButton(iconPath: "assets/icons/Bell.svg"),
        ],
      ),
    );
  }
}
