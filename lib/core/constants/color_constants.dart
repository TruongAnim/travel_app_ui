import 'package:flutter/material.dart';

class ColorPalette {
  static const primaryColor = Color(0xff6357CC);
  static const secondaryColor = Color(0xff8F67E8);
  static const backgroundScaffodColor = Color(0xfff2f2f2);
}

class Gradients {
  static const Gradient defaultGradient = LinearGradient(colors: [
    ColorPalette.secondaryColor,
    ColorPalette.primaryColor,
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
}
