import 'package:flutter/material.dart';

class cirlceIcon extends StatelessWidget {
  const cirlceIcon(
      {super.key,
      required this.icon,
      this.height = 30,
      this.iconSize = 25.0,
      this.width = 30,
      this.color = Colors.black});

  final double width, height, iconSize;
  final IconData? icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
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
    );
  }
}
