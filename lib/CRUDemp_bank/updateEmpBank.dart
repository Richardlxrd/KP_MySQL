import 'package:flutter/material.dart';
import 'package:kp_mysql/CRUDemp_bank/createEmpBank.dart';
import 'package:kp_mysql/mysql/APIconnection.dart';

class editDataWidget extends StatefulWidget {
  const editDataWidget({super.key});

  @override
  State<editDataWidget> createState() => _editDataWidgetState();
}

class _editDataWidgetState extends State<editDataWidget> {
  Future<void> updateDataEmpBank(
      int ID, String eSn, String eFn, String eMn, String Position) async {
    final db = Mysql();

    await db.getConnection().then((conn) async {
      await conn.query(
          'UPDATE emp_bank SET E_SN = ?, E_FN = ?, E_MN = ?, Position = ? WHERE ID = ?',
          [eSn, eFn, eMn, Position, ID]);
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
            controller: E_SNController,
            decoration: InputDecoration(labelText: 'E_SN'),
          ),
          TextField(
            controller: E_FNController,
            decoration: InputDecoration(labelText: 'E_FN'),
          ),
          TextField(
            controller: E_MNController,
            decoration: InputDecoration(labelText: 'E_MN'),
          ),
          TextField(
            controller: PositionController,
            decoration: InputDecoration(labelText: 'Position'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                final ID = int.parse(IDController.text);
                final eSn = E_SNController.text;
                final eFn = E_FNController.text;
                final eMn = E_MNController.text;
                final Position = PositionController.text;
                updateDataEmpBank(ID, eSn, eFn, eMn, Position);
              },
              child: Text('Change Data'),
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
