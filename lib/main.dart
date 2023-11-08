import 'package:flutter/material.dart';
import 'CRUDemp_bank/createEmpBank.dart';
import 'CRUDemp_bank/deleteEmpBank.dart';
import 'CRUDemp_bank/readEmpBank.dart';
import 'CRUDemp_bank/updateEmpBank.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Row(
          children: <Widget>[
            NavigationRail(
                elevation: 3,
                backgroundColor: Colors.grey[100],
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.all,
                destinations: const <NavigationRailDestination>[
                  NavigationRailDestination(
                      icon: Icon(
                        Icons.people_outlined,
                      ),
                      selectedIcon: Icon(
                        Icons.people,
                      ),
                      label: Text('Customers')),
                  NavigationRailDestination(
                      icon: Icon(
                        Icons.work_outline_outlined,
                      ),
                      selectedIcon: Icon(
                        Icons.work_outlined,
                      ),
                      label: Text('C_industry')),
                  NavigationRailDestination(
                      icon: Icon(
                        Icons.badge_outlined,
                      ),
                      selectedIcon: Icon(
                        Icons.badge,
                      ),
                      label: Text('emp_bank')),
                ],
                selectedIndex: _selectedIndex),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 550, child: Show_emp_bank_data()),
                  OverflowBar(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddDataWidget();
                                },
                              );
                            },
                            child: Text('Create')),
                      ),
                      OutlinedButton(onPressed: () {}, child: Text('Read')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return editDataWidget();
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
                                return deleteDataWidget();
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
            ),
          ],
        ));
  }
}
