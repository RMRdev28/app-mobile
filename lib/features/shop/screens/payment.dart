import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:plv/base_template.dart';

class Payemnt extends StatefulWidget {
  @override
  _PayemntState createState() => _PayemntState();
}

class _PayemntState extends State<Payemnt> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
        body: Theme(
        data: ThemeData(
        primaryColor: TColors.primary,
        colorScheme: const ColorScheme.light(primary: TColors.primary),
    ),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoriesPayemnt(
            selectedIndex: selectedIndex,
            onCategorySelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildPaymentDetails(),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }

  List<Widget> _buildPaymentDetails() {
    switch (selectedIndex) {
      case 0:
        return [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: TColors.primaryBackground,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: TColors.primary.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/cib.png', height: 40.0),
                    SizedBox(width: 10.0),
                    Text(
                      'Paye avec CIB & E-DAHABIA',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      'Montant à payer:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      '40000 DA',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                // Replace this with your captcha widget
                Text('Captcha here'),
                Container(
                  height: 300, // Ajustez la hauteur selon vos besoins
                  child: WebViewPlus(
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (controller) {
                      controller.loadUrl("assets/webpages/index.html");
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Checkbox(
                      value: true, // Update this as needed
                      onChanged: (bool? value) {
                        // Handle checkbox change
                      },
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        "J'accepte les Conditions générales de vente",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                    },
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Payer avec CIB'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: TColors.secondary,
                      backgroundColor: TColors.primary,
                      padding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 24.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
      case 1:
        return [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: TColors.primaryBackground,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: TColors.primary.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Banque :',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    Text(
                      'SOCIETE GENERALE ALGERIE',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Virement à l’ordre de',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    Text(
                      'PLV Algérie',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Compte N°',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    Text(
                      '021 00009 1150227036 CLE 31',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle button press
                    },
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Commandé'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: TColors.secondary,
                      backgroundColor: TColors.primary,
                      padding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 24.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
      case 2:
        return [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: TColors.primaryBackground,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: TColors.primary.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'À l\'ordre de',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    Text(
                      '	PLV Algérie',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Compte N°',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    Text(
                      '021 00009 1150227036 CLE 31',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle button press
                    },
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Commandé'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: TColors.secondary,
                      backgroundColor: TColors.primary,
                      padding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 24.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
      case 3:
        return [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: TColors.primaryBackground,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: TColors.primary.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Approchez-vous de nos locaux',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Iconsax.location),
                    Text(
                      'PLV Algérie Birkadem',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Iconsax.location),
                    Text(
                      'PLV Algérie Reghaia',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle button press
                    },
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Commandé'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: TColors.secondary,
                      backgroundColor: TColors.primary,
                      padding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 24.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
      case 4:
        return [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: TColors.primaryBackground,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: TColors.primary.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Banque :',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    Text(
                      'Baridi Mob',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Virement à l’ordre de',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    Text(
                      'ARAIBI Amine',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Compte N°',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    Text(
                      '00799999000093609086',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle button press
                    },
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Commandé'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: TColors.secondary,
                      backgroundColor: TColors.primary,
                      padding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 24.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
      case 5:
        return [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: TColors.primaryBackground,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: TColors.primary.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/paypal.jpg', height: 40.0),
                    SizedBox(width: 10.0),
                    Text(
                      'Paye avec Paypal',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      'Montant à payer:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      '40000 DA',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                // Replace this with your captcha widget
                Text('Captcha here'),
                Container(
                  height: 300, // Ajustez la hauteur selon vos besoins
                  child: WebViewPlus(
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (controller) {
                      controller.loadUrl("assets/webpages/index.html");
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Checkbox(
                      value: true, // Update this as needed
                      onChanged: (bool? value) {
                        // Handle checkbox change
                      },
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        "J'accepte les Conditions générales de vente",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle button press
                    },
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Payer avec Paypal'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: TColors.secondary,
                      backgroundColor: TColors.primary,
                      padding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 24.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
      // Add more cases here for other categories if needed
      default:
        return [];
    }
  }
}

class CategoriesPayemnt extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onCategorySelected;

  CategoriesPayemnt(
      {required this.selectedIndex, required this.onCategorySelected});

  @override
  _CategoriesPayemntState createState() => _CategoriesPayemntState();
}

class _CategoriesPayemntState extends State<CategoriesPayemnt> {
  List<String> categories = [
    "CIB & E-Dahabia",
    "Virement bancaire",
    "Cheque",
    "Espèces",
    "Baridi Mob",
    "Paypal"
  ];

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        widget.onCategorySelected(index);
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
                color: widget.selectedIndex == index
                    ? TColors.primary
                    : TColors.darkGrey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: TSizes.sm / 4),
              height: 2,
              width: 30,
              color: widget.selectedIndex == index
                  ? TColors.primary
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
