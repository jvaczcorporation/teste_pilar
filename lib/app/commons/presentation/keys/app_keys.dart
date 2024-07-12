import 'package:flutter/material.dart';

import 'keys.dart';

extension KeysExtension on String {
  Key toKey() => Key(this);

  String toSymbol() => "#$this";
}

typedef K = AppKeys;

class AppKeys {
  static const HomeKeys home = HomeKeys();
}
