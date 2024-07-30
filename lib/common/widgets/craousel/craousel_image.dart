import 'package:flutter/material.dart';

class CraouselImage extends StatelessWidget {
  CraouselImage({
    super.key,
    required this.imageNetwork,
  });

  String imageNetwork;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.network(
          imageNetwork,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
