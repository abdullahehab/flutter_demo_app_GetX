import 'package:flutter/material.dart';

extension Strings on String? {
  bool isEmptyOrNull() {
    if (this == null) return true;
    return this?.isEmpty ?? true;
  }

  double toDouble() => double.parse(this ?? '');
  int toInt() => int.parse(this ?? '');
}
