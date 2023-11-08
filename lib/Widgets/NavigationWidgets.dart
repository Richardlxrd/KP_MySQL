import 'package:flutter/material.dart';
import 'package:kp_mysql/CRUDc_customers/showCustomersDataWidget.dart';
import 'package:kp_mysql/CRUDc_industry/showC_industryDataWidget.dart';
import 'package:kp_mysql/CRUDemp_bank/showEmpDataWidget.dart';

class NavigationRailWidget extends StatefulWidget {
  const NavigationRailWidget({super.key});

  @override
  State<NavigationRailWidget> createState() => _NavigationRailWidgetState();
}

class _NavigationRailWidgetState extends State<NavigationRailWidget> {
  final List<Widget> dataShowScreen = <Widget>[
    ShowCustomersDataWidget(),
    ShowC_industryDataWidget(),
    ShowEmpBankDataWidget(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _selectedIndex,
          elevation: 3,
          backgroundColor: Colors.grey[100],
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.all,
          destinations: <NavigationRailDestination>[
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
        ),
        dataShowScreen[_selectedIndex],
      ],
    );
  }
}
