import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plv/features/shop/model/product_model.dart';
import 'package:plv/features/shop/screens/order.dart';
import 'package:plv/utils/constants/colors.dart';

// ignore: must_be_immutable
class VerticalCard extends StatelessWidget {
  const VerticalCard({super.key, required this.product});

  final Product product; // Add this field

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
              Image.network("https://plv-algerie.com/${product.media.path}",
                  height: 130, fit: BoxFit.cover),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: TColors.primary),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${product.start_price} DZD",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: TColors.primary),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => Order(product: product));
                    },
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
        ],
      ),
    );
  }
}
