import 'package:flutter/material.dart';
import 'package:plv/common/widgets/cicle_icon.dart';
import 'package:plv/utils/constants/colors.dart';
import '../../../features/shop/screens/order.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HorizontalCard extends StatelessWidget {
  HorizontalCard(
      {super.key,
      required this.productName,
      required this.price,
      this.oldPrice,
      this.discount,
      required this.imageUrl,
      this.hasDiscount = false,
      this.hasOldPrice = false});

  String productName;
  double price;
  double? oldPrice, discount;
  String imageUrl;
  bool hasDiscount;
  bool hasOldPrice;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
      height: 150,
      width: screenWidth * 0.8,
      child: Row(
        children: [
          Stack(children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(imageUrl),
            ),
            hasDiscount
                ? Positioned(
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
                      child: const Center(
                        child: Text(
                          "25%",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ]),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end, // Align text to start
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 130,
                      child: Text(
                        productName,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: TColors.primary),
                      ),
                    ),
                    const Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      "$price DZD",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: TColors.primary),
                    ),
                    hasOldPrice
                        ? Text(
                      "$oldPrice DZD",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: TColors.secondary,
                          decorationThickness: 2),
                    )
                        : const SizedBox(height: 15),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                    width: 200,
                    height: 40,
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => Order());
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        backgroundColor: TColors.primary,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            bottomRight: Radius.circular(18),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Ajouter au panier",
                        style: TextStyle(
                          color: TColors.secondary,
                          fontSize: 12,
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
