/*
import 'package:flutter/material.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'order.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: darkMode ? TColors.white : TColors.dark),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Magasin', style: TextStyle(color: darkMode ? TColors.white : TColors.dark)),
        backgroundColor: darkMode ? TColors.dark : TColors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
          height: 55,
          margin: const EdgeInsets.symmetric (horizontal: 15),
          padding: const EdgeInsets.only (right: 5),
          decoration: BoxDecoration(
              color: TColors.primaryBackground,
              borderRadius: BorderRadius.circular (15)
          ), // BoxDec
          child: const Row(
            children: [ Expanded (
          child: TextField(
          decoration: InputDecoration (
            border: InputBorder.none,
              prefixIcon: Icon(
            Icons.search,
            color: TColors.primary ), // Icon
          hintText: "Recherche",
          hintStyle: TextStyle(color: Colors.black26)), // InputDecoration
    ),
    ),
    ],// TextField // Expanded
    ),
    ),
          Expanded(
            child: Categories(),
          ),
        ],
      ),
    );
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Snapup",
    "Beach flag",
    "Desk publicitaire",
    "Porte brochure",
    "Stop trottoir",
    "Ensign magasin",
    "Présentoir",
    "Banner - Roll up"
  ];
  List<String> images = [
    'assets/images/snapup.jpg',
    'assets/images/beach_flag.JPG',
    'assets/images/desk_publicitaire.JPG',
    'assets/images/porte_brochure.JPG',
    'assets/images/stop_trottoir.JPG',
    'assets/images/ensign_magasin.JPG',
    'assets/images/presentoir.JPG',
    'assets/images/banner_rollup.JPG'
  ];

  Map<String, List<String>> categoryImages = {
    "Snapup": ["assets/images/stand_pop_up.JPG", "assets/images/photo_call_banner.JPG"],
    "Beach flag": ["assets/images/Beach flag courbé.JPG", "assets/images/Beach flag Goute.JPG", "assets/images/Oriflamme géant.JPG"],
    "Desk publicitaire": ["assets/images/desk_publicitaire_item1.JPG", "assets/images/desk_publicitaire_item2.JPG"],
    "Porte brochure": ["assets/images/porte_brochure_item1.JPG", "assets/images/porte_brochure_item2.JPG"],
    "Stop trottoir": ["assets/images/stop_trottoir_item1.JPG", "assets/images/stop_trottoir_item2.JPG"],
    "Ensign magasin": ["assets/images/ensign_magasin_item1.JPG", "assets/images/ensign_magasin_item2.JPG"],
    "Présentoir": ["assets/images/presentoir_item1.JPG", "assets/images/presentoir_item2.JPG"],
    "Banner - Roll up": ["assets/images/banner_rollup_item1.JPG", "assets/images/banner_rollup_item2.JPG"],
  };


  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    String selectedCategory = categories[selectedIndex];
    List<String> selectedImages = categoryImages[selectedCategory] ?? [];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
            child: SizedBox(
              height: 25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => buildCategory(index),
              ),
            ),
          ),
          Image.asset(
            images[selectedIndex],
            fit: BoxFit.cover,
            width: double.infinity,
            height: 160,
          ),
          Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: Text(
              "Nos réalisations",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: TColors.primary,
              ),
            ),
          ),
    if (selectedImages.isNotEmpty)
    Container(
    height: 360, // Define the height to ensure the widget is laid out properly
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: selectedImages.length,
    itemBuilder: (context, index) {
    return CardsItem(
    itemImage: selectedImages[index],
    itemName: "Item ${index + 1}",
    itemPrice: "120000",
    );
    },
    ),
    ),
    ],
      ),
    );
    }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: TSizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? TColors.primary : TColors.darkGrey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: TSizes.sm / 4),
              height: 2,
              width: 30,
              color: selectedIndex == index ? TColors.primary : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

class CardsItem extends StatefulWidget {
  final String itemImage;
  final String itemName;
  final String itemPrice;

  CardsItem({
    required this.itemImage,
    required this.itemName,
    required this.itemPrice,
  });

  @override
  _CardsItemState createState() => _CardsItemState();
}

class _CardsItemState extends State<CardsItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 25),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: TColors.primaryBackground,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.itemImage,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: -5,
                  right: -5,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 22,
                      color: TColors.primary,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      Get.to(() => Order());
                      // Ajoutez ici la logique pour ajouter ou retirer l'article des favoris
                  },
                  ),
                ),
              ],
            ),
            SizedBox(height: TSizes.sm),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.itemName,
                    style: TextStyle(fontSize: 16), // Taille de police réduite
                  ),
                  Text(
                    '300 x 220 cm',
                    style: TextStyle(fontSize: 11,color: TColors.textSecondary),
                    // Taille de police réduite
                  ),
                  SizedBox(height: TSizes.sm),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.itemPrice} DA',
                          style: TextStyle(fontSize: 16), // Taille de police réduite
                        ),
                        Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: TColors.secondary,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            Icons.add_shopping_cart,
                            size: 17,
                            color: TColors.black,
                          ), // Taille de l'icône réduite
                        ),
                      ],
                    ),
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
*/
import 'package:flutter/material.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'order.dart';
import '../../../common/widgets/product/horizontal_card.dart';
import '../../../common/widgets/product/vertical_card.dart';
import '../../../common/widgets/cicle_icon.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List<String> categories = [
    "Snapup",
    "Beach flag",
    "Desk publicitaire",
    "Porte brochure",
    "Stop trottoir",
    "Ensign magasin",
    "Présentoir",
    "Banner - Roll up"
  ];

  String categorieSelected = "Snapup";

  Map<String, List<String>> categoryImages = {
    "Snapup": ["assets/images/stand_pop_up.JPG", "assets/images/photo_call_banner.JPG"],
    "Beach flag": ["assets/images/Beach flag courbé.JPG", "assets/images/Beach flag Goute.JPG", "assets/images/Oriflamme géant.JPG"],
    "Desk publicitaire": ["assets/images/desk_publicitaire_item1.JPG", "assets/images/desk_publicitaire_item2.JPG"],
    "Porte brochure": ["assets/images/porte_brochure_item1.JPG", "assets/images/porte_brochure_item2.JPG"],
    "Stop trottoir": ["assets/images/stop_trottoir_item1.JPG", "assets/images/stop_trottoir_item2.JPG"],
    "Ensign magasin": ["assets/images/ensign_magasin_item1.JPG", "assets/images/ensign_magasin_item2.JPG"],
    "Présentoir": ["assets/images/presentoir_item1.JPG", "assets/images/presentoir_item2.JPG"],
    "Banner - Roll up": ["assets/images/banner_rollup_item1.JPG", "assets/images/banner_rollup_item2.JPG"],
  };

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    List<String> selectedImages = categoryImages[categorieSelected] ?? [];
    return Scaffold(
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
                          prefixIcon: Icon(Icons.search,
                              color: TColors.primary),
                          hintText: "Rechercher un produit...",
                          hintStyle: TextStyle(color: Colors.black26),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 8),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          categorieSelected = categories[index];
                        });
                      },
                      child: cirlceIcon(
                        icon: _getIconForCategory(categories[index]),
                        color: categorieSelected == categories[index]
                            ? TColors.primaryBackground
                            : TColors.primary,
                        backgroundColor: categorieSelected == categories[index]
                            ? TColors.primary
                            : TColors.primaryBackground,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                    hasDiscount:true,
                    oldPrice:300000,
                    hasOldPrice: true,
                    discount: 25,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 16.0),
              child: Text(
                "Nos Produits",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.69, // Adjust the aspect ratio to allow for content height
              ),
              padding: const EdgeInsets.all(10.0),
              itemCount: selectedImages.length,
              itemBuilder: (context, index) {
                return VerticalCard(
                  imageUrl: selectedImages[index],
                  price: 230000,
                  productName: "Beach flag courbé 2,80 Mètre",
                  isLocalImage: true,
                    hasDiscount:true,
                    oldPrice:300000,
                  hasOldPrice: true,
                  discount: 25,// Adjust this according to your image source
                );
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
          color: backgroundColor, // Background color of the icon
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
      ),
    );
  }
}
/*
  Widget buildProductCard(String imagePath, String productName, String price,
      String? oldPrice, int discount, bool isBestSeller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    imagePath,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                if (discount > 0)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '-$discount%',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    isBestSeller ? Icons.favorite : Icons.favorite_border,
                    color: isBestSeller ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                productName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    price,
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  if (oldPrice != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        oldPrice,
                        style: TextStyle(fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => Order());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Passer à la commande'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductMoreBuyingCard(String imagePath, String productName,
      String price, String? oldPrice, int discount, bool isBestSeller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
                  child: Image.asset(
                    imagePath,
                    height: double.infinity,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                if (discount > 0)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '-$discount%',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: TColors.primary),
                        ),
                        SizedBox(height: 8),
                        Text(
                          price,
                          style: TextStyle(
                              fontSize: 16,
                              color: TColors.primary,
                              fontWeight: FontWeight.bold),
                        ),
                        if (oldPrice != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              oldPrice,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => Order());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: TColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text('Passer à la commande'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
*/
