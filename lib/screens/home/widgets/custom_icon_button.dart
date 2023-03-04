import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  final String iconPath;
  final void Function()? onTap;

  const CustomIconButton({
    Key? key,
    required this.iconPath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(0),
        onPressed: onTap,
        icon: SvgPicture.asset(iconPath),
      ),
    );
  }
}
