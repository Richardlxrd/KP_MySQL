import 'package:flutter/material.dart';
import 'package:kp_mysql/CRUDemp_bank/emp_bankClasses.dart';
import 'package:kp_mysql/mysql/APIconnection.dart';

class sort_emp_bank_data extends StatefulWidget {
  const sort_emp_bank_data({super.key});

  @override
  State<sort_emp_bank_data> createState() => _sort_emp_bank_data();
}

class _sort_emp_bank_data extends State<sort_emp_bank_data> {
  Future<List<emp_bank>> sort_emp_bank() async {
    var db = Mysql();

    String sql =
        'select * from 282_strahov.emp_bank UNION SELECT * FROM `emp_bank` ORDER BY `ID` ASC;';

    final List<emp_bank> mylist = [];

    await db.getConnection().then((conn) async {
      await conn.query(sql).then((results) {
        for (var res in results) {
          final emp_bank mySQLdata = emp_bank(
            ID: res['ID'].toInt(),
            E_SN: res['E_SN'],
            E_FN: res['E_FN'],
            E_MN: res['E_MN'],
            Position: res['Position'],
          );
          mylist.add(mySQLdata);
        }
      });

      conn.close();
    });

    return mylist;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<emp_bank>>(
      future: sort_emp_bank(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return SingleChildScrollView(
          child: DataTable(
            columns: <DataColumn>[
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Фамилия')),
              DataColumn(label: Text('Имя')),
              DataColumn(label: Text('Отчество')),
              DataColumn(
                label: Text('Должность'),
              ),
            ],
            rows: snapshot.data!.map((bank) {
              return DataRow(
                cells: <DataCell>[
                  DataCell(Text('${bank.ID}')),
                  DataCell(Text(bank.E_SN)),
                  DataCell(Text(bank.E_FN)),
                  DataCell(Text(bank.E_MN)),
                  DataCell(
                    Text(bank.Position),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class show_sorted_emp_data extends StatelessWidget {
  const show_sorted_emp_data({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(children: [
        Expanded(child: sort_emp_bank_data()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close')),
        )
      ]),
    );
  }
}
