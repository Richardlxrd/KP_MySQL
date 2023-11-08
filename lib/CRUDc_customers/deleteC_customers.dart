import 'package:flutter/material.dart';
import 'package:kp_mysql/mysql/APIconnection.dart';
import 'package:kp_mysql/CRUDc_customers/c_customersClasses.dart';

class deleteCustomersDataWidget extends StatefulWidget {
  const deleteCustomersDataWidget({super.key});

  @override
  State<deleteCustomersDataWidget> createState() =>
      _deleteCustomersDataWidgetState();
}

class _deleteCustomersDataWidgetState extends State<deleteCustomersDataWidget> {
  Future<void> deleteDataCustomers(
    int ID,
  ) async {
    final db = Mysql();

    await db.getConnection().then((conn) async {
      await conn.query('DELETE FROM `customers` WHERE ID = ?', [ID]);
      await conn.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          TextField(
            controller: IDController,
            decoration: InputDecoration(labelText: 'ID'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                final ID = int.parse(IDController.text);
                deleteDataCustomers(
                  ID,
                );
              },
              child: Text('Delete Data'),
            ),
          ),
          OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'))
        ],
      ),
    );
  }
}
