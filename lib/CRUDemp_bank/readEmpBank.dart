import 'package:kp_mysql/CRUDemp_bank/emp_bankClasses.dart';
import 'package:kp_mysql/mysql/APIconnection.dart';
import 'package:flutter/material.dart';

class Show_emp_bank_data extends StatefulWidget {
  const Show_emp_bank_data({super.key});

  @override
  State<Show_emp_bank_data> createState() => _Show_emp_bank_data();
}

class _Show_emp_bank_data extends State<Show_emp_bank_data> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<emp_bank>>(
      future: show_emp_bank(),
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

Future<List<emp_bank>> show_emp_bank() async {
  var db = Mysql();

  String sql = 'select * from 282_strahov.emp_bank;';

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
    }).onError((error, stackTrace) {
      print(error);

      return null;
    });

    conn.close();
  });

  return mylist;
}
