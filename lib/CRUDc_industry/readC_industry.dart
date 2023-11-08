import 'package:flutter/material.dart';
import 'package:kp_mysql/CRUDc_industry/c_industryClasses.dart';
import 'package:kp_mysql/mysql/APIconnection.dart';

class Show_c_industry_data extends StatefulWidget {
  const Show_c_industry_data({super.key});

  @override
  State<Show_c_industry_data> createState() => _Show_c_industry_data();
}

class _Show_c_industry_data extends State<Show_c_industry_data> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<c_industry>>(
      future: show_c_industry(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final c_industry = snapshot.data![index];

            return Table(
              border: TableBorder.all(color: Colors.black, width: 0.5),
              children: <TableRow>[
                TableRow(children: [
                  Text(c_industry.N_industry),
                  Text('${c_industry.Price_for_year}'),
                  Text('${c_industry.C_ID}'),
                  Text(c_industry.C_SN),
                  Text('${c_industry.E_ID}'),
                  Text(c_industry.E_SN),
                ]),
              ],
            );
          },
        );
      },
    );
  }
}

Future<List<c_industry>> show_c_industry() async {
  var db = Mysql();

  String sql = 'select * from 282_strahov.c_industry;';

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
