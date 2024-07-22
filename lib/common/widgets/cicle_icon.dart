import 'package:flutter/material.dart';
import 'package:plv/utils/constants/colors.dart';

class cirlceIcon extends StatelessWidget {
  const cirlceIcon({
    super.key,
    required this.icon,
    this.height = 50,
    this.iconSize = 25.0,
    this.width = 50,
    this.color = TColors.primary,
    this.backgroundColor = TColors.primaryBackground,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
  });

  final double width, height, iconSize;
  final IconData? icon;
  final Color color;
  final Color backgroundColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor, // Background color of the icon
          border: Border.all(color: Colors.black12),
          shape: BoxShape.circle, // Makes the container circular
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon, // Icon to be displayed
            color: color, // Icon color
            size: iconSize, // Icon size
          ),
        ),
      ),
    );
  }
}
