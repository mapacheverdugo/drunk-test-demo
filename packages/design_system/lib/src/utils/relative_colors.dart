import 'package:flutter/material.dart';

class RelativeColors {
  static Color getRelativeColors(
    Color color, {
    double h = 0.0,
    double s = 0.0,
    double l = 0.0,
  }) {
    final hslColor = HSLColor.fromColor(color);

    final rh = (hslColor.hue + h).clamp(0.0, 360.0);
    final rs = (hslColor.saturation + s).clamp(0.0, 1.0);
    final rl = (hslColor.lightness + l).clamp(0.0, 1.0);

    return HSLColor.fromAHSL(hslColor.alpha, rh, rs, rl).toColor();
  }
}
