import 'package:flutter/material.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'package:get/get.dart';

class Payemnt extends StatefulWidget {
  @override
  _PayemntState createState() => _PayemntState();
}

class _PayemntState extends State<Payemnt> {
  String? selectedOption;

  void _selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: CategoriesPayemnt(
              onCategorySelected: (int selectedIndex) {
                setState(() {
                  if (selectedIndex == 0) {
                    selectedOption = 'CIB & E-Dahabia';
                  } else {
                    selectedOption = null;
                  }
                });
              },
            ),
          ),
          if (selectedOption == 'CIB & E-Dahabia') ...[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Image.asset('assets/images/cib.png', height: 40.0),
                      SizedBox(width: 10.0),
                      Text(
                        'Paye avec CIB & E-DAHABIA',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  // Replace this with your captcha widget
                  Text('Captcha here'),
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
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class CategoriesPayemnt extends StatefulWidget {
  final Function(int) onCategorySelected;

  CategoriesPayemnt({required this.onCategorySelected});

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

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    String selectedCategory = categories[selectedIndex];
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
        setState(() {
          selectedIndex = index;
        });
        widget.onCategorySelected(selectedIndex);
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
