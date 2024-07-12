import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF08243C);

  static List<BoxShadow> boxShadowContainer = [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 3,
      offset: const Offset(0, 1),
      spreadRadius: 1,
    )
  ];
}
