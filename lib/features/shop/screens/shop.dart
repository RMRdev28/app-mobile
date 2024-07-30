import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plv/base_template.dart';
import 'package:plv/features/shop/controller/product_controller.dart';
import 'package:plv/features/shop/model/product_model.dart';
import 'package:plv/features/shop/model/category_model.dart';
import 'package:plv/utils/constants/colors.dart';
import '../../../common/widgets/product/horizontal_card.dart';
import '../../../common/widgets/product/vertical_card.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final ProductController _productController = Get.put(ProductController());
  late Future<List<Product>> _products;
  late Future<List<Category>> _categories;
  String defaultSlug = "banner-roll-up";
  String categorieSelected = "Nos Produits";

  @override
  void initState() {
    super.initState();
    _products = _productController.fetchProducts(defaultSlug);
    _categories = _productController.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 55,
                padding: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: TColors.primaryBackground,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon:
                              Icon(Icons.search, color: TColors.primary),
                          hintText: "Rechercher un produit...",
                          hintStyle: TextStyle(color: Colors.black26),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
              child: SizedBox(
                height: 50,
                child: FutureBuilder<List<Category>>(
                  future: _categories,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No categories found'));
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final category = snapshot.data![index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                categorieSelected = category.name;
                                defaultSlug = category.slug;
                                _products = _productController
                                    .fetchProducts(defaultSlug);
                              });
                            },
                            child: cirlceIcon(
                              icon: _getIconForCategory(category.name),
                              color: categorieSelected == category.name
                                  ? TColors.primaryBackground
                                  : const Color.fromRGBO(36, 87, 170, 1),
                              backgroundColor:
                                  categorieSelected == category.name
                                      ? TColors.primary
                                      : TColors.primaryBackground,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Le Plus Vendu Ce Mois",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Column(
                children: [
                  HorizontalCard(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlxCy5HQLSzKst-QAHR0fAHqFf4K-XvCM2ow&s",
                    price: 230000,
                    productName: "Beach flag courbé 2,80 Mètre",
                    hasDiscount: true,
                    oldPrice: 300000,
                    hasOldPrice: true,
                    discount: 25,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text(
                categorieSelected,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
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
          ],
        ),
      ),
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category) {
      case "Snapup":
        return Icons.home;
      case "Beach flag":
        return Icons.checkroom;
      case "Desk publicitaire":
        return Icons.computer;
      case "Porte brochure":
        return Icons.book;
      case "Stop trottoir":
        return Icons.stop;
      case "Ensign magasin":
        return Icons.store;
      case "Présentoir":
        return Icons.display_settings;
      case "Banner - Roll up":
        return Icons.flag;
      default:
        return Icons.home;
    }
  }
}

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
          color: backgroundColor,
          border: Border.all(color: Colors.black12),
          shape: BoxShape.circle,
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
            icon,
            color: color,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
