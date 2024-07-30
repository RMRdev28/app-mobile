import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'payment.dart';

class Livraison extends StatefulWidget {
  @override
  _LivraisonState createState() => _LivraisonState();
}

class _LivraisonState extends State<Livraison> {
  String? selectedOption;

  void _selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  void _showValidationDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 50),
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: TColors.darkerGrey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Get.to(Payemnt());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                  foregroundColor: TColors.secondary,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildDesignOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(15),
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
        child: Row(
          children: [
            Icon(icon, size: 40, color: TColors.primary),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFormCard({
    required IconData icon,
    required String title,
    required List<Widget> fields,
    required String validationTitle,
  }) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
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
        children: [
          Icon(icon, size: 50, color: TColors.primary),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ...fields,
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _showValidationDialog(context, validationTitle);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.primary,
              foregroundColor: TColors.secondary,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text('save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livraison'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildDesignOption(
              icon: Icons.store,
              title: 'RÉCUPÉRER CHEZ PLV ALGÉRIE',
              onTap: () => _showValidationDialog(context, 'Adresse actualisé'),
            ),
            selectedOption == 'BUREAU DE LA SOCIÉTÉ DE LIVRAISON'
                ? buildFormCard(
              icon: Icons.local_shipping,
              title: 'BUREAU DE LA SOCIÉTÉ DE LIVRAISON',
              fields: [
                DropdownButtonFormField(
                  items: [
                    DropdownMenuItem(child: Text('Choisir la wilaya de livraison'), value: 'wilaya1'),
                    // Add other items here
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: 'Choisir la wilaya de livraison',
                    errorText: 'Veuillez choisir la wilaya de livraison',
                  ),
                ),
                SizedBox(height: TSizes.sm,),
                DropdownButtonFormField(
                  items: [
                    DropdownMenuItem(child: Text('please select Wilaya first'), value: 'wilaya2'),
                    // Add other items here
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: 'please select Wilaya first',
                  ),
                ),
              ],
              validationTitle: 'Adresse actualisé',
            )
                : buildDesignOption(
              icon: Icons.local_shipping,
              title: 'BUREAU DE LA SOCIÉTÉ DE LIVRAISON',
              onTap: () => _selectOption('BUREAU DE LA SOCIÉTÉ DE LIVRAISON'),
            ),
            selectedOption == 'LIVRAISON À MON ADRESSE'
                ? buildFormCard(
              icon: Icons.home,
              title: 'LIVRAISON À MON ADRESSE',
              fields: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Adresse de livraison à domicile',
                  ),
                ),
                SizedBox(height: TSizes.sm,),
                DropdownButtonFormField(
                  items: [
                    DropdownMenuItem(child: Text('Choisir la wilaya de livraison'), value: 'wilaya1'),
                    // Add other items here
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: 'Choisir la wilaya de livraison',
                    errorText: 'Veuillez choisir la wilaya de livraison',
                  ),
                ),
                SizedBox(height: TSizes.sm,),
                DropdownButtonFormField(
                  items: [
                    DropdownMenuItem(child: Text('please select Wilaya first'), value: 'wilaya2'),
                    // Add other items here
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: 'please select Wilaya first',
                  ),
                ),
              ],
              validationTitle: 'Adresse actualisé',
            )
                : buildDesignOption(
              icon: Icons.home,
              title: 'LIVRAISON À MON ADRESSE',
              onTap: () => _selectOption('LIVRAISON À MON ADRESSE'),
            ),
          ],
        ),
      ),
    );
  }
}
