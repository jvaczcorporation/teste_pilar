import 'package:flutter/material.dart';

class AppHelper {
  static Color getColorByRate(double rate) {
    if (rate >= 7) {
      return Colors.greenAccent;
    } else if (rate >= 2) {
      return Colors.yellowAccent;
    } else {
      return Colors.redAccent;
    }
  }
}
