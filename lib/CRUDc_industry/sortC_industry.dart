import 'package:flutter/material.dart';
import 'package:kp_mysql/CRUDc_industry/c_industryClasses.dart';
import 'package:kp_mysql/mysql/APIconnection.dart';

class Show_sorted_c_industry_data extends StatefulWidget {
  const Show_sorted_c_industry_data({super.key});

  @override
  State<Show_sorted_c_industry_data> createState() =>
      _Show_sorted_c_industry_data();
}

class _Show_sorted_c_industry_data extends State<Show_sorted_c_industry_data> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<c_industry>>(
      future: sort_c_industry(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return SingleChildScrollView(
          child: DataTable(
            columns: <DataColumn>[
              DataColumn(label: Text('N_Industry')),
              DataColumn(label: Text('Price_for_year')),
              DataColumn(label: Text('C_ID')),
              DataColumn(label: Text('C_SN')),
              DataColumn(
                label: Text('E_ID'),
              ),
              DataColumn(
                label: Text('E_SN'),
              ),
            ],
            rows: snapshot.data!.map((bank) {
              return DataRow(
                cells: <DataCell>[
                  DataCell(Text(bank.N_industry)),
                  DataCell(Text('${bank.Price_for_year}')),
                  DataCell(Text('${bank.C_ID}')),
                  DataCell(Text(bank.C_SN)),
                  DataCell(
                    Text('${bank.E_ID}'),
                  ),
                  DataCell(Text(bank.E_SN))
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

Future<List<c_industry>> sort_c_industry() async {
  var db = Mysql();

  String sql =
      'select * from 282_strahov.c_industry UNION SELECT * FROM `c_industry` ORDER BY `C_ID` ASC;';

  final List<c_industry> mylist = [];

  await db.getConnection().then((conn) async {
    await conn.query(sql).then((results) {
      for (var res in results) {
        final c_industry mySQLdata = c_industry(
          N_industry: res['N_industry'],
          Price_for_year: res['Price_for_year'].toDouble(),
          C_ID: res['C_ID'].toInt(),
          C_SN: res['C_SN'],
          E_ID: res['E_ID'].toInt(),
          E_SN: res['E_SN'],
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

class show_sorted_c_industry_data extends StatelessWidget {
  const show_sorted_c_industry_data({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(children: [
        Expanded(child: Show_sorted_c_industry_data()),
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
