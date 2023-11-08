import 'package:flutter/material.dart';
import 'package:kp_mysql/CRUDemp_bank/createEmpBank.dart';
import 'package:kp_mysql/mysql/APIconnection.dart';

class deleteDataWidget extends StatefulWidget {
  const deleteDataWidget({super.key});

  @override
  State<deleteDataWidget> createState() => _deleteDataWidgetState();
}

class _deleteDataWidgetState extends State<deleteDataWidget> {
  Future<void> deleteDataEmpBank(
    int ID,
  ) async {
    final db = Mysql();

    await db.getConnection().then((conn) async {
      await conn.query('DELETE FROM `emp_bank` WHERE ID = ?', [ID]);
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
                deleteDataEmpBank(
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
