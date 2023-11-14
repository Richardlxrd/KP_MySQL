import 'package:flutter/material.dart';
import 'package:kp_mysql/mysql/APIconnection.dart';

import 'emp_bankClasses.dart';

class editEmpDataDataWidget extends StatefulWidget {
  const editEmpDataDataWidget({super.key});

  @override
  State<editEmpDataDataWidget> createState() => _editEmpDataDataState();
}

class _editEmpDataDataState extends State<editEmpDataDataWidget> {
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
              child: Text('Закрыть'))
        ],
      ),
    );
  }
}
