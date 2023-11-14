import 'package:flutter/material.dart';
import 'package:kp_mysql/CRUDc_industry/createC_industry.dart';
import 'package:kp_mysql/CRUDc_industry/deleteC_industry.dart';
import 'package:kp_mysql/CRUDc_industry/readC_industry.dart';
import 'package:kp_mysql/CRUDc_industry/updateC_industry.dart';

class ShowC_industryDataWidget extends StatefulWidget {
  const ShowC_industryDataWidget({super.key});

  @override
  State<ShowC_industryDataWidget> createState() =>
      _ShowC_industryDataWidgetState();
}

class _ShowC_industryDataWidgetState extends State<ShowC_industryDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Show_c_industry_data(),
          OverflowBar(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return createC_industry();
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
                          return editC_industryDataWidget();
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
                        return deleteC_industryDataWidget();
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
              )
            ],
          )
        ],
      ),
    );
  }
}
