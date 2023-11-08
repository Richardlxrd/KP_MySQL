import 'package:flutter/material.dart';

class c_industry {
  final String N_industry;
  final double Price_for_year;
  final int C_ID;
  final String C_SN;
  final int E_ID;
  final String E_SN;

  c_industry({
    required this.N_industry,
    required this.Price_for_year,
    required this.C_ID,
    required this.C_SN,
    required this.E_ID,
    required this.E_SN,
  });
}

final N_industryController = TextEditingController();
final PriceForYearController = TextEditingController();
final C_IDController = TextEditingController();
final C_SNController = TextEditingController();
final E_IDController = TextEditingController();
final E_SNController = TextEditingController();
