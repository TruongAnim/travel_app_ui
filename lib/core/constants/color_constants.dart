import 'package:flutter/material.dart';

class ColorPalette {
  static const primaryColor = Color(0xff6357CC);
  static const secondaryColor = Color(0xff8F67E8);
  static const Color yellowColor = Color(0xffFE9C5E);

  static const Color dividerColor = Color(0xFFE5E7EB);
  static const Color text1Color = Color(0xFF323B4B);
  static const Color subTitleColor = Color(0xFF838383);
  static const backgroundScaffodColor = Color(0xfff2f2f2);
}

class Gradients {
  static const Gradient defaultGradient = LinearGradient(colors: [
    ColorPalette.secondaryColor,
    ColorPalette.primaryColor,
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
}
