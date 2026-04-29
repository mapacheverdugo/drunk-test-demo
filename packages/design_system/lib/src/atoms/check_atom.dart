import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CheckAtom extends StatelessWidget {
  const CheckAtom({
    required this.isChecked,
    required this.onChanged,
    super.key,
    this.height = 24,
    this.width = 24,
    this.borderRadius = 5,
    this.borderWitdh = 1,
  });

  final double height;
  final double width;
  final double borderRadius;
  final double borderWitdh;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Checkbox(
        checkColor: ForestColors.white,
        fillColor: WidgetStateProperty.all(
          isChecked ? ForestColors.accentForest : ForestColors.white,
        ),
        activeColor: ForestColors.accentForest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
        side: BorderSide(
          color: ForestColors.darkestForest,
          width: borderWitdh,
        ),
        value: isChecked,
        onChanged: (value) {
          if (value == null) return onChanged(false);

          onChanged(value);
        },
      ),
    );
  }
}
