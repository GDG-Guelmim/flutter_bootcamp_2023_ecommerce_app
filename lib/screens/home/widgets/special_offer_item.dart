import 'package:ecommerce/models/special_offer_model.dart';
import 'package:flutter/material.dart';

class SpecialOfferItem extends StatelessWidget {
  final SpecialOfferModel offer;
  const SpecialOfferItem({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 100,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            SizedBox(
              width: 250,
              height: 100,
              child: Image.asset(
                offer.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(0),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 10,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${offer.name}\n",
                      style: const TextStyle(fontSize: 16),
                    ),
                    TextSpan(
                      text: "${offer.number} Brands",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                style: const TextStyle(
                  color: Colors.white,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
