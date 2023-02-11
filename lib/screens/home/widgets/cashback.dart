import 'package:flutter/material.dart';

class CashBack extends StatelessWidget {
  const CashBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Color(0xff4A3298),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "A Summer Surpise",
            style: TextStyle(
              color: Colors.white.withOpacity(.7),
              fontSize: 10,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Cashback 20%",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
