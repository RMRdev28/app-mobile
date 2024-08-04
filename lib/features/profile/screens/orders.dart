import 'package:flutter/material.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'package:plv/base_template.dart';
import 'details.dart';
import 'package:get/get.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      body: Padding(
        padding: const EdgeInsets.all(TSizes.md),
        child:Container(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mes achats',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary,
                ),
              ),
              SizedBox(height: TSizes.md),
              OrderTablePage(),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderTablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
          child: DataTable(
            headingRowColor: MaterialStateProperty.all(TColors.primaryBackground),
            columns: [
              DataColumn(label: Flexible(
                child: Text('Order Number', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: TColors.textSecondary)),
              )),
              DataColumn(label: Flexible(
                child: Text('Date de Commande', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: TColors.textSecondary)),
              )),
              DataColumn(label: Flexible(
                child: Text('Total', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: TColors.textSecondary)),
              )),
              DataColumn(label: Flexible(
                child: Text('Statut', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: TColors.textSecondary)),
              )),
              DataColumn(label: Flexible(
                child: Text('Tracking Code', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: TColors.textSecondary)),
              )),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('903')),
                DataCell(Text('04/08/2024\n18:41:11')),
                DataCell(Text('142,800.00\nDA')),
                DataCell(Text('En cours de confirmation')),
                DataCell(
                  Row(
                    children: [
                      Expanded(child: Text('Tracking is Waiting Order Approval From Admin')),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.primary,
                          foregroundColor: TColors.secondary,
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('Voir les détails', style: TextStyle(fontSize: 13),),
                      ),
                    ],
                  ),
                ),
              ]),
              DataRow(cells: [
                DataCell(Text('903')),
                DataCell(Text('04/08/2024\n18:41:11')),
                DataCell(Text('142,800.00\nDA')),
                DataCell(Text('En cours de confirmation')),
                DataCell(
                  Row(
                    children: [
                      Expanded(child: Text('Tracking is Waiting Order Approval From Admin')),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.primary,
                          foregroundColor: TColors.secondary,
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('Voir les détails', style: TextStyle(fontSize: 13),),
                      ),
                    ],
                  ),
                ),
              ]),
              DataRow(cells: [
                DataCell(Text('903')),
                DataCell(Text('04/08/2024\n18:41:11')),
                DataCell(Text('142,800.00\nDA')),
                DataCell(Text('En cours de confirmation')),
                DataCell(
                  Row(
                    children: [
                      Expanded(child: Text(' Order Approval From Admin')),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => Details());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.primary,
                          foregroundColor: TColors.secondary,
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('Voir les détails', style: TextStyle(fontSize: 13),),
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      );
  }
}
