import 'package:flutter/material.dart';
import 'package:plv/base_template.dart';
import 'package:plv/common/widgets/craousel/craousel.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import '../../../common/widgets/product/horizontal_card.dart';
import '../../../common/widgets/product/vertical_card.dart';
import 'package:plv/features/shop/controller/product_controller.dart';
import 'package:plv/features/shop/model/product_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const List<String> imageUrls = [
    'assets/images/snapup.jpg',
    'assets/images/beach_flag.JPG',
    'assets/images/desk_publicitaire.JPG',
    'assets/images/porte_brochure.JPG',
    'assets/images/stop_trottoir.JPG',
    'assets/images/ensign_magasin.JPG',
    'assets/images/presentoir.JPG',
    'assets/images/banner_rollup.JPG'
  ];

  @override
  Widget build(BuildContext context) {
    final ProductController _productController = ProductController();
    Future<List<Product>> _products = _productController.fetchProducts('default-slug');

    return BaseTemplate(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Craousel(),
            SizedBox(height: TSizes.md),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Nos categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary,
                ),
              ),
            ),
            SizedBox(height: TSizes.sm),
            SizedBox(
              height: 150, // Adjust the height according to your needs
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Image.asset(imageUrls[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: TSizes.md),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.asset("assets/images/impression.JPG"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Nos produits',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: HorizontalCard(
                imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlxCy5HQLSzKst-QAHR0fAHqFf4K-XvCM2ow&s",
                price: 30000,
                productName: "product name",
              ),
            ),
            SizedBox(height: TSizes.sm),
            FutureBuilder<List<Product>>(
              future: _products,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No products found'));
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 0.69,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final product = snapshot.data![index];
                      return VerticalCard(product: product);
                    },
                  );
                }
              },
            ),
            SizedBox(height: TSizes.md),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.asset("assets/images/impression.JPG"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
