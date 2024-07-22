import 'package:flutter/material.dart';
import 'package:plv/utils/constants/colors.dart';

// ignore: must_be_immutable
class VerticalCard extends StatelessWidget {
  const VerticalCard({
    super.key,
    required this.productName,
    required this.price,
    this.oldPrice,
    this.discount,
    required this.imageUrl,
    this.hasDiscount = false,
    this.hasOldPrice = false,
    this.isLocalImage =
        false, // Add a flag to indicate if the image is local or network
  });

  final String productName;
  final double price;
  final double? oldPrice, discount;
  final String imageUrl;
  final bool hasDiscount;
  final bool hasOldPrice;
  final bool isLocalImage; // Add this field

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: isLocalImage
                    ? Image.asset(imageUrl,
                        height: 130, fit: BoxFit.cover) // Use local image
                    : Image.network(imageUrl,
                        height: 130, fit: BoxFit.cover), // Use network image
              ),
              if (hasDiscount)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: TColors.secondary.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                      ),
                    ),
                    width: 50,
                    height: 35,
                    child: Center(
                      child: Text(
                        "${discount?.toStringAsFixed(0)}%",
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite, color: Colors.red),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$price DZD",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: TColors.primary),
                        ),
                        const SizedBox(height: 8),
                        if (hasOldPrice)
                          Text(
                            "$oldPrice DZD",
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: TColors.secondary,
                                decorationThickness: 2),
                          ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        backgroundColor: TColors.primary,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            bottomRight: Radius.circular(18),
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: TColors.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
