import 'package:flutter/material.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'package:plv/base_template.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Map<String, bool> _expandedStatus = {};

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
        body:SingleChildScrollView(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: TColors.success, size: 24.0),
                SizedBox(width: 2.0), // Add some space between the icon and the text
                Expanded(
                  child: Text(
                    'Votre commande a été reçue avec succès',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: TColors.success,
                    ),
                    textAlign: TextAlign.right, // Align text to the right
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.0),
            Container(
              decoration: BoxDecoration(
                color: TColors.primaryBackground,
                boxShadow: [
                  BoxShadow(
                    color: TColors.primary.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(4.0), // Rounded corners for the card
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSummaryRow('N° de commande','904'),
                    SizedBox(height: TSizes.sm),
                    _buildSummaryRow('Date et heure',  '04/08/2024 22:26'),
                    SizedBox(height: TSizes.sm),
                    _buildSummaryRow('Total',  '30 940.00 DA'),
                    SizedBox(height: TSizes.sm),
                    _buildSummaryRow('Méthode de paiement',  '---'),
                    SizedBox(height: TSizes.sm),
                    _buildSummaryRow('Etat de paiement', 'Paiement n\'est pas effectué'),
                    SizedBox(height: TSizes.sm),
                    _buildSummaryRow('N° de Transactions', '---'),
                    SizedBox(height: TSizes.sm),
                    _buildSummaryRow('Date de Transactions', '---'),
                    SizedBox(height: TSizes.sm),
                    _buildSummaryRow('Nom & prénom', 'test'),
                    SizedBox(height: TSizes.sm),
                    _buildSummaryRow('Numéro téléphone', '0678034522'),
                    SizedBox(height: TSizes.sm),
                    _buildSummaryRow('Adresse', '---'),
                    SizedBox(height: TSizes.sm),
                    _buildSummaryRow('Livraison', 'Récupérer chez plv algerie'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Détail de la commande',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: TColors.primary,
              ),
            ),
            SizedBox(height: 10.0),
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
            SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 250, // Set a fixed width for all buttons
                child: TextButton(
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: TColors.secondary,
                    foregroundColor: TColors.primary,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.shopping_cart), // The icon you want to display
                      SizedBox(width: 8), // Space between icon and text
                      Text('Mes achats',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child:SizedBox(
                width: 250, // Set a fixed width for all buttons
                child:ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.white,
                  foregroundColor: TColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_card), // The icon you want to display
                    SizedBox(width: 8), // Space between icon and text
                    Text('Produits similaire'),
                  ],
                ),
              ),
            ),
            ),
            SizedBox(height: 10),
            Center(
              child:SizedBox(
                width: 250, // Set a fixed width for all buttons
                child:ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.white,
                  foregroundColor: TColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.picture_as_pdf), // The icon you want to display
                    SizedBox(width: 8), // Space between icon and text
                    Text('Telecharger'),
                  ],
                ),
              ),
            ),
            ),
            SizedBox(height: 10),
            Center(
              child:SizedBox(
                width: 250, // Set a fixed width for all buttons
                child:ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.white,
                  foregroundColor: TColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.print), // The icon you want to display
                    SizedBox(width: 8), // Space between icon and text
                    Text('Imprimer'),
                  ],
                ),
              ),
            ),
            ),
            SizedBox(height: 10),
            Center(
              child:SizedBox(
                width: 250, // Set a fixed width for all buttons
                child:ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.white,
                  foregroundColor: TColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.email), // The icon you want to display
                    SizedBox(width: 8), // Space between icon and text
                    Text('Envoyer par mail'),
                  ],
                ),
              ),
              ),
            ),
          ],
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
      child: ExpansionTile(
        title: Text(numero),
        trailing: IconButton(
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
        children: _buildExpansionContent(),
        onExpansionChanged: (bool expanded) {
          setState(() {
            _expandedStatus[numero] = expanded;
          });
        },
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
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
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
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: TColors.textSecondary,
          ),
        ),
        Text(value),
      ],
    );
  }
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

