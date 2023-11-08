import 'package:flutter/material.dart';

class emp_bank {
  final int ID;
  final String E_SN;
  final String E_FN;
  final String E_MN;
  final String Position;

  emp_bank({
    required this.ID,
    required this.E_SN,
    required this.E_FN,
    required this.E_MN,
    required this.Position,
  });
}

final IDController = TextEditingController();
final E_SNController = TextEditingController();
final E_FNController = TextEditingController();
final E_MNController = TextEditingController();
final PositionController = TextEditingController();
