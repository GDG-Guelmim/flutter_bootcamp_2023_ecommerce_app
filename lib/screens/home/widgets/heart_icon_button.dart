import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeartIconButton extends StatelessWidget {
  final bool isFavorite;

  const HeartIconButton({
    Key? key,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/Heart Icon_2.svg",
          color: isFavorite ? Colors.red : Colors.grey,
          height: 10,
        ),
      ),
    );
  }
}
