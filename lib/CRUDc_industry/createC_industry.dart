import 'package:flutter/material.dart';
import 'package:kp_mysql/CRUDc_industry/c_industryClasses.dart';
import 'package:kp_mysql/mysql/APIconnection.dart';

class createC_industry extends StatefulWidget {
  @override
  State<createC_industry> createState() => _createC_industryState();
}

class _createC_industryState extends State<createC_industry> {
  Future<void> insertDatac_industry(
    String N_industry,
    double Price_for_year,
    int C_ID,
    String C_SN,
    int E_ID,
    String E_SN,
  ) async {
    final db = Mysql();

    await db.getConnection().then((conn) async {
      await conn.query(
          'INSERT INTO c_industry (N_industry, Price_for_year, C_ID, C_SN, E_ID, E_SN) VALUES (?, ?, ?, ?, ?, ?)',
          [N_industry, Price_for_year, C_ID, C_SN, E_ID, E_SN]);
      await conn.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          TextField(
            controller: N_industryController,
            decoration: InputDecoration(labelText: 'N_industry'),
          ),
          TextField(
            controller: PriceForYearController,
            decoration: InputDecoration(labelText: 'Price for year'),
          ),
          TextField(
            controller: C_IDController,
            decoration: InputDecoration(labelText: 'C_ID'),
          ),
          TextField(
            controller: C_SNController,
            decoration: InputDecoration(labelText: 'C_SN'),
          ),
          TextField(
            controller: E_IDController,
            decoration: InputDecoration(labelText: 'E_ID'),
          ),
          TextField(
            controller: E_SNController,
            decoration: InputDecoration(labelText: 'E_SN'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                final N_industry = N_industryController.text;
                final Price_for_year =
                    double.parse(PriceForYearController.text);
                final C_ID = int.parse(C_IDController.text);
                final C_SN = C_SNController.text;
                final E_ID = int.parse(E_IDController.text);
                final E_SN = E_SNController.text;
                insertDatac_industry(
                    N_industry, Price_for_year, C_ID, C_SN, E_ID, E_SN);
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
