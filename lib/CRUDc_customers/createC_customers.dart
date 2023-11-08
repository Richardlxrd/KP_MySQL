import 'package:flutter/material.dart';
import 'package:kp_mysql/mysql/APIconnection.dart';
import 'package:kp_mysql/CRUDc_customers/c_customersClasses.dart';

class createCustomers extends StatefulWidget {
  @override
  State<createCustomers> createState() => _createCustomersState();
}

class _createCustomersState extends State<createCustomers> {
  Future<void> insertDataCustomers(int ID, String C_FN, String C_MN,
      String C_SN, double Income_mln, int Leading_ID, String E_SN) async {
    final db = Mysql();

    await db.getConnection().then((conn) async {
      await conn.query(
          'INSERT INTO customers (ID, C_FN, C_MN, C_SN, Income_mln, Leading_ID, E_SN) VALUES (?, ?, ?, ?, ?, ?, ?)',
          [ID, C_FN, C_MN, C_SN, Income_mln, Leading_ID, E_SN]);
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
          TextField(
            controller: C_FNController,
            decoration: InputDecoration(labelText: 'C_FN'),
          ),
          TextField(
            controller: C_MNController,
            decoration: InputDecoration(labelText: 'C_MN'),
          ),
          TextField(
            controller: C_SNController,
            decoration: InputDecoration(labelText: 'C_SN'),
          ),
          TextField(
            controller: Income_mlnController,
            decoration: InputDecoration(labelText: 'Income_mln'),
          ),
          TextField(
            controller: Leading_IDController,
            decoration: InputDecoration(labelText: 'Leading_ID'),
          ),
          TextField(
            controller: E_SNController,
            decoration: InputDecoration(labelText: 'E_SN'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                final int ID = int.parse(IDController.text);
                final String C_FN = C_FNController.text;
                final String C_MN = C_MNController.text;
                final String C_SN = C_SNController.text;
                final double Income_mln =
                    double.parse(Income_mlnController.text);
                final int Leading_ID = int.parse(Leading_IDController.text);
                final String E_SN = E_SNController.text;
                insertDataCustomers(
                    ID, C_FN, C_MN, C_SN, Income_mln, Leading_ID, E_SN);
              },
              child: Text('Add Data'),
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
