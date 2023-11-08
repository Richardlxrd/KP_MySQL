import 'package:flutter/material.dart';
import 'package:kp_mysql/mysql/APIconnection.dart';

class AddDataWidget extends StatefulWidget {
  @override
  State<AddDataWidget> createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  Future<void> insertDataEmpBank(
      int ID, String E_SN, String E_FN, String E_MN, String Position) async {
    final db = Mysql();

    await db.getConnection().then((conn) async {
      await conn.query(
          'INSERT INTO emp_bank (ID, E_SN, E_FN, E_MN, Position) VALUES (?, ?, ?, ?, ?)',
          [ID, E_SN, E_FN, E_MN, Position]);
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
                final E_SN = E_SNController.text;
                final E_FN = E_FNController.text;
                final E_MN = E_MNController.text;
                final Position = PositionController.text;
                insertDataEmpBank(ID, E_SN, E_FN, E_MN, Position);
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

final IDController = TextEditingController();
final E_SNController = TextEditingController();
final E_FNController = TextEditingController();
final E_MNController = TextEditingController();
final PositionController = TextEditingController();
