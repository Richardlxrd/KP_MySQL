import 'package:flutter/material.dart';
import 'package:kp_mysql/CRUDc_industry/c_industryClasses.dart';
import 'package:kp_mysql/mysql/APIconnection.dart';

class deleteC_industryDataWidget extends StatefulWidget {
  const deleteC_industryDataWidget({super.key});

  @override
  State<deleteC_industryDataWidget> createState() =>
      _deleteC_industryDataWidgetState();
}

class _deleteC_industryDataWidgetState
    extends State<deleteC_industryDataWidget> {
  Future<void> deleteDatac_industry(
    int c_ID,
  ) async {
    final db = Mysql();

    await db.getConnection().then((conn) async {
      await conn.query('DELETE FROM `c_industry` WHERE C_ID = ?', [c_ID]);
      await conn.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          TextField(
            controller: C_IDController,
            decoration: InputDecoration(labelText: 'c_ID'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                final ID = int.parse(C_IDController.text);
                deleteDatac_industry(
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
