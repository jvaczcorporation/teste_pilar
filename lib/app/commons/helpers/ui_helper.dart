import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';

abstract class UiHelper {
  void showSnackBar(String message);
}

class UiHelperImpl implements UiHelper {
  @override
  void showSnackBar(String message) {
    Asuka.showSnackBar(SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(message),
    ));
  }
}
