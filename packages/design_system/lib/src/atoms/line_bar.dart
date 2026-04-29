import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:flutter/material.dart';

class LineBar extends StatelessWidget {
  const LineBar({
    super.key,
    this.width = 80,
    this.height = 4,
    this.borderRadius = 999,
    this.color = ForestColorsOld.colorWood200,
  });

  final double width;
  final double height;
  final double borderRadius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: ForestColorsOld.colorWood200,
          ),
        ),
      ],
    );
  }
}
