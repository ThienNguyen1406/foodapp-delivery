import 'package:flutter/material.dart';

class AreaProvider extends ChangeNotifier {
  String? selectedZone;
  String? selectedArea;

  List<String> zones = ['Banasree', 'VietNam', 'Japan'];
  List<String> areas = ['Area 1', 'Area 2', 'Area 3'];
}
