import 'package:flutter/material.dart';
import 'package:plv/common/widgets/craousel/craousel.dart';
import 'package:plv/common/widgets/craousel/craousel_image.dart';

import '../../../common/widgets/product/horizontal_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [Craousel()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
