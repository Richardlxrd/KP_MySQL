import 'package:flutter/material.dart';
import 'package:kp_mysql/CRUDc_customers/createC_customers.dart';
import 'package:kp_mysql/CRUDc_customers/deleteC_customers.dart';
import 'package:kp_mysql/CRUDc_customers/readC_customers.dart';
import 'package:kp_mysql/CRUDc_customers/sortC_Customers.dart';
import 'package:kp_mysql/CRUDc_customers/updateC_customers.dart';

class ShowCustomersDataWidget extends StatefulWidget {
  const ShowCustomersDataWidget({super.key});

  @override
  State<ShowCustomersDataWidget> createState() =>
      _ShowCustomersDataWidgetState();
}

class _ShowCustomersDataWidgetState extends State<ShowCustomersDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(flex: 1, child: Show_customers_data()),
          OverflowBar(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return createCustomers();
                        },
                      );
                    },
                    child: Text('Create')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return editCustomersDataWidget();
                        },
                      );
                    },
                    child: Text('Update')),
              ),
              OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return deleteCustomersDataWidget();
                      },
                    );
                  },
                  child: Text('Delete')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Icon(
                    Icons.update_outlined,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return show_sorted_customers_data();
                      });
                },
                child: Icon(
                  Icons.sort_by_alpha_outlined,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
