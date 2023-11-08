import 'package:flutter/material.dart';

class Customers {
  final int ID;
  final String C_FN;
  final String C_MN;
  final String C_SN;
  final double Income_mln;
  final int Leading_ID;
  final String E_SN;

  Customers(
      {required this.ID,
      required this.C_FN,
      required this.C_MN,
      required this.C_SN,
      required this.Income_mln,
      required this.Leading_ID,
      required this.E_SN});
}

final IDController = TextEditingController();
final C_FNController = TextEditingController();
final C_MNController = TextEditingController();
final C_SNController = TextEditingController();
final Income_mlnController = TextEditingController();
final Leading_IDController = TextEditingController();
final E_SNController = TextEditingController();
