import 'package:flutter/material.dart';

import '../../../models/special_offer_model.dart';
import 'section_title.dart';
import 'special_offer_item.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(text: "Special for you"),
        SizedBox(
          width: double.maxFinite,
          height: 100,
          child: ListView.builder(
            itemCount: specialOffersList.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return SpecialOfferItem(
                offer: specialOffersList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
