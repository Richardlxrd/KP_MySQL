import 'package:flutter/material.dart';
import 'package:kp_mysql/CRUDc_customers/c_customersClasses.dart';
import 'package:kp_mysql/mysql/APIconnection.dart';

Future<List<Customers>> show_customers() async {
  var db = Mysql();

  String sql = 'select * from 282_strahov.customers;';

  final List<Customers> mylist = [];

  await db.getConnection().then((conn) async {
    await conn.query(sql).then((results) {
      for (var res in results) {
        final Customers mySQLdata = Customers(
          ID: res['ID'].toInt(),
          C_FN: res['C_FN'],
          C_MN: res['C_MN'],
          C_SN: res['C_SN'],
          Income_mln: res['Income_mln'].toDouble(),
          Leading_ID: res['Leading_ID'].toInt(),
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

class Show_customers_data extends StatefulWidget {
  const Show_customers_data({super.key});

  @override
  State<Show_customers_data> createState() => _Show_customers_data();
}

class _Show_customers_data extends State<Show_customers_data> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Customers>>(
      future: show_customers(),
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
            final customers = snapshot.data![index];

            return Table(
              border: TableBorder.all(color: Colors.black, width: 0.5),
              children: <TableRow>[
                TableRow(children: [
                  Text('${customers.ID}'),
                  Text(customers.C_FN),
                  Text(customers.C_MN),
                  Text(customers.C_SN),
                  Text('${customers.Income_mln}'),
                  Text('${customers.Leading_ID}'),
                  Text(customers.E_SN),
                ]),
              ],
            );
          },
        );
      },
    );
  }
}
