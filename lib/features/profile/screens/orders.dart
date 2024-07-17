import 'package:flutter/material.dart';
import 'package:plv/utils/constants/colors.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example data, replace with your actual data fetching logic
    final orders = [
      {
        'orderNumber': '123456',
        'date': '2023-06-30',
        'totalAmount': '100.00',
        'status': 'En cours',
        'trackingCode': 'ABC123'
      },
      {
        'orderNumber': '654321',
        'date': '2023-06-29',
        'totalAmount': '250.00',
        'status': 'Livré',
        'trackingCode': 'XYZ789'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Mes achats'),
        backgroundColor: TColors.primary,
      ),
      body: Column(
        children: [
          TabBar(
            tabs: [
              Tab(icon: Icon(Icons.shopping_bag), text: 'Mes achats'),
              Tab(icon: Icon(Icons.local_shipping), text: 'Suivi colis'),
              Tab(icon: Icon(Icons.settings), text: 'Paramètres'),
            ],
            labelColor: TColors.primary,
            unselectedLabelColor: Colors.grey,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('N° COMMANDE')),
                  DataColumn(label: Text('DATE COMMANDE')),
                  DataColumn(label: Text('MONTANT TOTAL')),
                  DataColumn(label: Text('STATUS')),
                  DataColumn(label: Text('TRACKING CODE')),
                ],
                rows: orders.map((order) {
                  return DataRow(cells: [
                    DataCell(Text(order['orderNumber']!)),
                    DataCell(Text(order['date']!)),
                    DataCell(Text(order['totalAmount']!)),
                    DataCell(Text(order['status']!)),
                    DataCell(Text(order['trackingCode']!)),
                  ]);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
