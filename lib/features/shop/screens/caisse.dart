import 'package:flutter/material.dart';
import 'package:plv/features/shop/screens/livraison.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'livraison.dart';
import 'package:plv/base_template.dart';

class Caisse extends StatefulWidget {
  @override
  _CaisseState createState() => _CaisseState();
}

class _CaisseState extends State<Caisse> {
  Map<String, bool> _expandedStatus = {};

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
        body: Theme(
        data: ThemeData(
        primaryColor: TColors.primary,
        colorScheme: const ColorScheme.light(primary: TColors.primary),
    ),
    child:SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Commandes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary,
                ),
              ),
              SizedBox(height: TSizes.md),
              _buildHeader(),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  _buildItem('123456'),
                  _buildItem('123457'),
                  _buildItem('123458'),
                  _buildItem('123459'),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Resume',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary,
                ),
              ),
              SizedBox(height: TSizes.lg),
              Container(
                padding: const EdgeInsets.all(16.0),
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
                  children: <Widget>[
                    _buildSummaryRow('Total HT', '120000 DA'),
                    SizedBox(height: TSizes.sm,),
                    _buildSummaryRow('Total TVA', '128000 DA'),
                    SizedBox(height: TSizes.sm,),
                    _buildSummaryRow('TVA', '19 %'),
                    SizedBox(height: TSizes.sm,),
                    _buildSummaryRow('Livraison', '0.00 DA'),
                    SizedBox(height: TSizes.sm,),
                    _buildSummaryRow('Net à payer', '128000 DA'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // Logique pour trouver un autre produit
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.primary,
                      foregroundColor: TColors.secondary,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      textStyle: TextStyle(fontSize: 15),
                    ),
                    child: Text('Trouver autre produit'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => Livraison());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.secondary,
                      foregroundColor: TColors.primary,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      textStyle: TextStyle(fontSize: 15),
                    ),
                    child: Text('Suivant'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  Widget _buildItem(String numero) {
    bool isExpanded = _expandedStatus[numero] ?? false;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        color: TColors.primaryBackground,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text(numero),
                ),
              ),
              IconButton(
                icon: Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: TColors.primary,
                ),
                onPressed: () {
                  setState(() {
                    _expandedStatus[numero] = !isExpanded;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Logique de suppression
                },
              ),
            ],
          ),
          if (isExpanded) ..._buildExpansionContent(),
        ],
      ),
    );
  }

  List<Widget> _buildExpansionContent() {
    return [
      _buildExpansionRow('Designation', 'test'),
      _buildExpansionRow('Prix unitaire HT', '120000 DA'),
      _buildExpansionRow('Montant HT', '120000 DA'),
      _buildExpansionRow('QTE', '1'),
      _buildExpansionRow('Date', '1/1/2024'),
    ];
  }

  Widget _buildExpansionRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
              fontSize: 14,
            ),
          ),
          Spacer(),
          Text(value, style: TextStyle(fontSize: 13,),),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Numero De Commande',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Details',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: TColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
