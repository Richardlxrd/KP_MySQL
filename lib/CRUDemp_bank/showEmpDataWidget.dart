import 'package:flutter/material.dart';
import 'package:kp_mysql/CRUDemp_bank/createEmpBank.dart';
import 'package:kp_mysql/CRUDemp_bank/readEmpBank.dart';
import 'package:kp_mysql/CRUDemp_bank/sortEmpBank.dart';
import 'package:kp_mysql/CRUDemp_bank/updateEmpBank.dart';

import 'deleteEmpBank.dart';

class ShowEmpBankDataWidget extends StatefulWidget {
  const ShowEmpBankDataWidget({super.key});

  @override
  State<ShowEmpBankDataWidget> createState() => _ShowEmpBankDataWidgetState();
}

class _ShowEmpBankDataWidgetState extends State<ShowEmpBankDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(flex: 1, child: Show_emp_bank_data()),
          OverflowBar(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return createEmpBank();
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
                          return editEmpDataDataWidget();
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
                        return deleteEmpDataDataWidget();
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
                        return show_sorted_emp_data();
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
