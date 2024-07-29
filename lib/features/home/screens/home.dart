import 'package:flutter/material.dart';
import 'package:plv/base_template.dart';
import 'package:plv/common/widgets/craousel/craousel.dart';

import '../../../common/widgets/product/horizontal_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  const Craousel(),
                  HorizontalCard(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlxCy5HQLSzKst-QAHR0fAHqFf4K-XvCM2ow&s",
                    price: 30000,
                    productName: "product name",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
