import 'package:design_system/src/atoms/text/text.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/spacing/spacing.dart';
import 'package:design_system/src/foundations/typography/typography.dart';
import 'package:flutter/material.dart';

class DisabledInput extends StatelessWidget {
  const DisabledInput({
    required this.hintText,
    super.key,
    this.label,
    this.labelColor = ForestColorsOld.colorWood900,
  });

  final String? label;
  final Color labelColor;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null) ...[
          Row(
            children: [
              ForestText.textBodyM(
                label: label!,
                color: labelColor,
              ),
            ],
          ),
          const SizedBox(height: ForestSpacing.spaceY1),
        ],
        TextField(
          decoration: InputDecoration(
            enabled: false,
            hintText: hintText,
            fillColor: ForestColorsOld.colorWood0,
            filled: true,
            hintStyle: const TextStyle(
              color: ForestColorsOld.colorWood500,
              fontSize: ForestTypography.textBodyM,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ForestColorsOld.colorWood300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
