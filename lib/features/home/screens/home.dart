import 'package:flutter/material.dart';

import '../../../common/widgets/product/horizontal_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  HorizontalCard(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlxCy5HQLSzKst-QAHR0fAHqFf4K-XvCM2ow&s",
                    price: 230000,
                    productName: "Beach flag courbé 2,80 Mètre",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
