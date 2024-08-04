import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension IntExtension on int? {
  int validata({int value = 0}) {
    return this ?? value;
  }

  Widget get h => SizedBox(
        height: this?.toDouble(),
      );

  Widget get w => SizedBox(
        width: this?.toDouble(),
      );
}
