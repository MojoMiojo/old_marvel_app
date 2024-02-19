import 'dart:ui';

import 'package:flutter/material.dart';

class ColorsUtil {
  static final white = Colors.white;

  static final vermelho = getColorByHex('#FA4A0C');
  static final cinza = getColorByHex('#C7C7C7');
  static final background = getColorByHex('#F2F2F2');
  static final backgroundInput = getColorByHex('#EFEEEE');

  static Color getColorByHex(String hex) {
    return Color(int.parse("0xFF${hex.replaceAll('#', '')}"));
  }
}
